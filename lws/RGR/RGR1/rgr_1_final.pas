PROGRAM CountWordsV1(INPUT, OUTPUT);
USES      
  ReadKeysIO,
  SortIO;
  
VAR
  InputFilename, OutputFilename, Word: STRING;
  FOut, FIn: TEXT;

BEGIN {CountWordsV1}
  WRITE('Please enter input file name: ');
  READLN(InputFilename);
  ASSIGN(FIn, InputFilename);
  WRITE('Please enter output file name: ');
  READLN(OutputFilename);
  ASSIGN(FOut, OutputFilename);
  RESET(FIn);      
  WHILE NOT EOF(FIn)
  DO
    BEGIN
      WHILE NOT EOLN(FIn)
      DO
        BEGIN
          ReadingKey(FIn, Word);
          IF Word <> ''
          THEN 
            Sort(Word);
          Word := '';
          Index := 0
        END;
      READLN(FIn)
    END;
  REWRITE(FOut);
  OutputKeys(FOut);          
  WRITELN('READY!');
  WRITELN
END.  {TreeSort}
           
