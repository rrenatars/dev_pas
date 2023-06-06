PROGRAM MergeTest(INPUT, OUTPUT);
VAR
  F1, F2: TEXT;
  
PROCEDURE Split(VAR F1, F2, F3: TEXT);
VAR 
  Ch, Switch: CHAR;
BEGIN {Split}
  RESET(F1);
  REWRITE(F2);
  REWRITE(F3);
  Switch := 'O';
  WHILE NOT EOF(F1)
  DO
    BEGIN 
      WHILE NOT EOLN(F1)
      DO
        BEGIN
          READ(F1, Ch);
          IF Switch = 'O'
          THEN
            BEGIN
              Switch := 'E';
              WRITE(F2, Ch)
            END  
          ELSE
            BEGIN
              Switch := 'O';
              WRITE(F3, Ch)
            END 
        END;
      READLN;
      WRITELN(F2);
      WRITELN(F3)
    END;    
  WRITELN(F2);
  WRITELN(F3)
END; {Split}
PROCEDURE Merge(VAR F1, F2, F3: TEXT);
VAR 
  Ch2, Ch3: CHAR;
BEGIN {Merge}
  RESET(F2);
  RESET(F3);
  REWRITE(F1);
  IF (NOT EOLN(F2)) AND (NOT EOLN(F3))
  THEN
    BEGIN
      READ(F2, Ch2);
      READ(F3, Ch3)
    END;
  WHILE (NOT(EOLN(F2))) OR (NOT(EOLN(F3)))
  DO
    BEGIN
      IF Ch2 < Ch3
      THEN 
        BEGIN
          WRITE(F1, Ch2);
          READ(F2, Ch2)
        END
      ELSE
        BEGIN
          WRITE(F1, Ch3);
          READ(F3, Ch3)
        END
    END;
  IF Ch2 < Ch3
  THEN
    BEGIN
      WRITE(F1, Ch2);
      WRITE(F1, Ch3)
    END
  ELSE
    BEGIN
      WRITE(F1, Ch3);
      WRITE(F1, Ch2)
    END;
  WHILE NOT EOLN(F2)
  DO
    BEGIN
      READ(F2, Ch2);
      IF NOT EOLN(F2)
      THEN
        BEGIN
          READ(F2, Ch3);
          IF Ch2 < Ch3
          THEN
            BEGIN
              WRITE(F1, Ch2);
              WRITE(F1, Ch3)
            END
        END
      ELSE
        WRITE(F1, Ch2)
    END;
  WHILE NOT EOLN(F3)
  DO
    BEGIN
      READ(F3, Ch2);
      IF NOT EOLN(F2)
      THEN
        BEGIN
          READ(F3, Ch3);
          IF Ch2 < Ch3
          THEN
            BEGIN
              WRITE(F1, Ch2);
              WRITE(F1, Ch3)
            END
        END    
      ELSE
        WRITE(F1, Ch2)
    END;    
  WRITELN(F1)
END; {Merge}

BEGIN
  Split(INPUT, F1, F2);
  Merge(OUTPUT, F1, F2)
END.
