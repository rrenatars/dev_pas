PROGRAM RunBubbleSort(INPUT, OUTPUT);
VAR
  F1, F2: TEXT;
  Sorted: CHAR;
  
PROCEDURE CopyFile(VAR InFile, OutFile: TEXT);
VAR
  Ch: CHAR;
BEGIN
  WHILE NOT EOLN(InFile)
  DO
    BEGIN
      READ(InFile, Ch);
      WRITE(OutFile, Ch)
    END;
  WRITELN(OutFile)
END;

PROCEDURE CopyAndSwap(VAR F1, F2: TEXT; VAR Sorted: CHAR);
VAR
  Ch1, Ch2: CHAR;
BEGIN  
  IF (NOT EOLN(F1))
  THEN
    BEGIN
      READ(F1, Ch1);
      WHILE NOT EOLN (F1)
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
              Sorted := 'N';
              READ(F1, Ch2)
            END
        END;
      WRITE(F2, Ch1)
    END
END;

BEGIN
  REWRITE(F1);
  CopyFile(INPUT, F1);
  Sorted := 'N';
  WHILE Sorted = 'N'
  DO
    BEGIN
      Sorted := 'Y';
      RESET(F1);
      REWRITE(F2);
      CopyAndSwap(F1, F2, Sorted);
      REWRITE(F1);
      RESET(F2);
      CopyFile(F2, F1)
    END;
  RESET(F1);
  CopyFile(F1, OUTPUT)
END.
  
  

