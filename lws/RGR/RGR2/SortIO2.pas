UNIT SortIO2;
INTERFACE
  PROCEDURE InsertWord(Data: STRING); 
  PROCEDURE PrintStatistic(VAR F: TEXT);
  
IMPLEMENTATION  
  USES
    ReadKeysIO2;
  CONST
    LimitOfWords = 10000;
  TYPE 
    Tree = ^NodeType;     
    NodeType = RECORD
                 Key: STRING;
                 LLink, RLink: Tree;
                 Count: INTEGER
               END;
  VAR
    Root: Tree; 
    CounterOfWords: INTEGER; 
    FOut: TEXT; 
    
  PROCEDURE OutputKeys(VAR FOut: TEXT);
  PROCEDURE OutputTree(VAR FOut: TEXT; Ptr: Tree);
  BEGIN {OutputTree}
    IF Ptr <> NIL
    THEN  {Печатает поддерево слева, вершину, поддерево справа}
      BEGIN                       
        OutputTree(FOut, Ptr^.LLink);
        WRITELN(FOut, Ptr^.Key, ' ', Ptr^.Count);
        OutputTree(FOut, Ptr^.RLink)
      END
  END;  {OutputTree}
  
  BEGIN {OutputKeys}
    OutputTree(FOut, Root)
  END; {OutputKeys}
  
  PROCEDURE CopyFile(VAR ResFile, RewFile: TEXT);
  VAR
    Ch: CHAR;
  BEGIN {CopyFile}
    WHILE NOT EOF(ResFile)
    DO
      BEGIN
        WHILE NOT EOLN(ResFile)
        DO
          BEGIN
            READ(ResFile, Ch);
            WRITE(RewFile, Ch)
          END;
        WRITELN(RewFile);
        READLN(ResFile)
      END
  END; {CopyFile}   
  
  PROCEDURE GetWordAndNumber(VAR FIn: TEXT; VAR Word: STRING; VAR Number: INTEGER);
  VAR
    Ch: CHAR;
  BEGIN {GetWordAndNumber}
    IF NOT EOF(FIn)
    THEN
      BEGIN   
        Word := '';
        Number := 0;
        IF NOT EOLN(FIn)
        THEN
          BEGIN
            REPEAT 
              READ(FIn, Ch);
              IF Ch <> ' '
              THEN
                Word := Word + Ch  
            UNTIL NOT(Ch <> ' ');
            IF (NOT EOLN(FIn)) AND (NOT EOF(FIn))
            THEN
              READLN(FIn, Number)
          END  
      END
  END; {GEtWordAndNumber} 
  
  PROCEDURE Merge(VAR FIn, FOut: TEXT);
  VAR
    FTemp: TEXT;
    Word1, Word2: STRING;
    CounterOfWord1, CounterOfWord2: INTEGER; 
     
  PROCEDURE MergeFileRemains(VAR F: TEXT; VAR CounterOfWord: INTEGER; VAR Word: STRING);
  BEGIN {MergeFileRemains}
    WHILE (NOT EOF(F)) OR (CounterOfWord <> 0)
    DO
      BEGIN
        WRITELN(FTemp, Word, ' ', CounterOfWord);
        CounterOfWord := 0;
        GetWordAndNumber(F, Word, CounterOfWord)
      END
  END; {MergeFileRemains} 
  
  BEGIN {Merge}
    REWRITE(FTemp);
    Word1 := '';
    Word2 := '';
    CounterOfWord1 := 0;
    CounterOfWord2 := 0;
    GetWordAndNumber(FIn, Word1, CounterOfWord1); 
    GetWordAndNumber(FOut, Word2, CounterOfWord2);   
    WHILE ((NOT EOF(FIn)) OR (CounterOfWord1 <> 0)) AND ((NOT EOF(FOut)) OR (CounterOfWord2 <> 0)) 
    DO
      BEGIN
        IF Lexico(Word1, Word2) = 1
        THEN
          BEGIN
            WRITELN(FTemp, Word1, ' ', CounterOfWord1);
            CounterOfWord1 := 0;
            GetWordAndNumber(FIn, Word1, CounterOfWord1) 
          END
        ELSE
          IF Lexico(Word1, Word2) = 2
          THEN
            BEGIN
              WRITELN(FTemp, Word2, ' ', CounterOfWord2);
              CounterOfWord2 := 0;
              GetWordAndNumber(FOut, Word2, CounterOfWord2)
            END
          ELSE
            BEGIN
              WRITELN(FTemp, Word1, ' ', CounterOfWord1 + CounterOfWord2);
              CounterOfWord1 := 0;
              CounterOfWord2 := 0;
              GetWordAndNumber(FIn, Word1, CounterOfWord1);
              GetWordAndNumber(FOut, Word2, CounterOfWord2)
            END
      END;
    MergeFileRemains(FIn, CounterOfWord1, Word1);
    MergeFileRemains(FOut, CounterOfWord2, Word2);
    RESET(FTemp);
    REWRITE(FOut);
    CopyFile(FTemp, FOut)
  END; {Merge}    
  
  PROCEDURE MergeSort(VAR FOut: TEXT);
  VAR
    F: TEXT;
  BEGIN {MergeSort}
    REWRITE(F);
    OutputKeys(F);
    RESET(F);
    RESET(FOut);
    Merge(F, FOut)
  END; {MergeSort}  
  
  PROCEDURE DisposeTree(VAR Ptr: Tree); 
  BEGIN {DisposeTree}
    IF Ptr <> NIL
    THEN 
      BEGIN
        DisposeTree(Ptr^.LLink);
        DisposeTree(Ptr^.RLink);
        DISPOSE(Ptr)
      END;
    Ptr := NIL  
  END; {DisposeTree}

  PROCEDURE InsertWord(Data: STRING); 
  PROCEDURE InsertWordToTree(VAR Ptr: Tree; Data: STRING); 
  BEGIN {InsertWordToTree}
    IF Ptr = NIL
    THEN
      BEGIN {Создаем лист со значением Data}
        NEW(Ptr);
        Ptr^.Key := Data;
        Ptr^.Count := 1;
        Ptr^.LLink := NIL;
        Ptr^.RLink := NIL 
      END
    ELSE
      BEGIN
        IF Lexico(Ptr^.Key, Data) = 2
        THEN
          InsertWordToTree(Ptr^.LLink, Data)
        ELSE
          BEGIN
            IF Lexico(Ptr^.Key, Data) = 1
            THEN                  
              InsertWordToTree(Ptr^.RLink, Data)
            ELSE 
              Ptr^.Count := Ptr^.Count + 1
          END
      END
  END; {InsertWordToTree}
  
  BEGIN {InsertWord}
    IF CounterOfWords = LimitOfWords
    THEN
      BEGIN
        MergeSort(FOut);
        DisposeTree(Root);
        Root := NIL;
        CounterOfWords := 0
      END;
    IF CounterOfWords < LimitOfWords
    THEN
      BEGIN
        InsertWordToTree(Root, Data);
        CounterOfWords := CounterOfWords + 1
      END
  END; {InsertWord}   
  
  PROCEDURE PrintStatistic(VAR F: TEXT);
  VAR
    Word: STRING;
    Number: INTEGER;
  BEGIN {PrintStatistic}
    MergeSort(FOut);
    DisposeTree(Root);
    Root := NIL;
    RESET(FOut);
    WHILE NOT EOF(FOut)
    DO
      BEGIN
        GetWordAndNumber(FOut, Word, Number);
        WRITELN(F, Word, ' ', Number)
      END
  END; {PrintStatistic}

BEGIN {SortIO2}
  REWRITE(FOut);
  Root := NIL;
  CounterOfWords := 0
END. {SortIO2}
