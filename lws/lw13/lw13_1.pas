PROGRAM BubbleSort(INPUT, OUTPUT);
PROCEDURE CopyFile(VAR InFile, OutFile: TEXT);
VAR 
  Ch: CHAR;
BEGIN {CopyFile}
  REWRITE(OutFile);
  WHILE NOT EOLN(InFile)
  DO
    BEGIN
      READ(InFile, Ch);
      WRITE(OutFile, Ch)
    END;
  WRITELN(OutFile)
END; {CopyFile}

PROCEDURE CopyAndSwap(VAR F1, F2: TEXT; VAR Sorted: CHAR);
VAR 
  Ch1, Ch2: CHAR;
BEGIN {CopyAndSwap}
  Sorted := 'Y';
  IF NOT EOLN(F1)
  THEN
    BEGIN
      READ(F1, Ch1);
      WHILE NOT EOLN(F1)
      DO
        BEGIN
          READ(F1, Ch2);
          IF Ch1 <= Ch2
          THEN
            BEGIN
              WRITE(F2, Ch1);
              Ch1 := Ch2
            END
          ELSE
            BEGIN
              WRITE(F2, Ch2);
              Sorted := 'N'
            END
        END;
    WRITELN(F2, Ch1)
  END
END; {CopyAndSwap}

PROCEDURE BubbleSort(VAR InFile, OutFile: TEXT);
VAR
  Sorted, Ch: CHAR;
  F1, F2: TEXT;
BEGIN
  REWRITE(F1);
  CopyFile(InFile, F1);
  Sorted := 'N';
  WHILE Sorted = 'N'
  DO
    BEGIN
      REWRITE(F2);
      RESET(F1);
      CopyAndSwap(F1, F2, Sorted);
      REWRITE(F1);
      RESET(F2); 
      CopyFile(F2, F1)   
    END;
  RESET(F1);
  CopyFile(F1, OutFile) 
END;
BEGIN
  BubbleSort(INPUT, OUTPUT)
END.


