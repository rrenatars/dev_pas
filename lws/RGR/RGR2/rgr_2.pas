PROGRAM CountWordsV1(INPUT, OUTPUT);
USES      
  ReadKeysIO2,
  SortIO2;
  
VAR
  InputFilename, OutputFilename, Word: STRING; 
  FOut, FIn: TEXT;

BEGIN {CountWordsV2}
  WRITE('Please enter input file name: ');
  READLN(InputFilename);
  ASSIGN(FIn, InputFilename);
  WRITE('Please enter output file name: ');
  READLN(OutputFilename);
  ASSIGN(FOut, OutputFilename);
  RESET(FIn);   
  REWRITE(FOut);   
  WHILE NOT EOF(FIn)
  DO
    BEGIN
      WHILE NOT EOLN(FIn)
      DO
        BEGIN
          ReadingKey(FIn, Word);
          IF Word <> ''
          THEN           
            InsertWord(Word)
        END;
      READLN(FIn)
    END;
  PrintStatistic(FOut);
  WRITELN('READY!');
  WRITELN
END. {CountWordsV2}
           
