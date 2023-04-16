PROGRAM lw14_3_B(INPUT, OUTPUT);
VAR
  F1, F2, F3: TEXT;

PROCEDURE RCopy(VAR F1, F2: TEXT);
VAR   {RCopy}
  Ch: CHAR;
BEGIN
  IF NOT EOLN(F1)
  THEN
    BEGIN
      READ(F1, Ch);
      WRITE(F2, Ch);
      RCopy(F1, F2)
    END;
END;   {RCopy}

PROCEDURE Merge(VAR F1, F2, F3: TEXT);
VAR 
  Ch2, Ch3: CHAR;
BEGIN {Merge}
  RESET(F2);
  RESET(F3);
  REWRITE(F1);
  READ(F2, Ch2);
  READ(F3, Ch3);
  WHILE ((NOT(EOLN(F2))) AND (NOT(EOLN(F3))))
  DO
    BEGIN
      IF Ch2 < Ch3
      THEN 
        BEGIN
          WRITE(F1, Ch2);
          READ(F2, Ch2);
          IF EOLN(F2)
          THEN
            WRITE(F1, Ch2)
        END
      ELSE
        BEGIN
          WRITE(F1, Ch3);
          READ(F3, Ch3);
          IF EOLN(F3)
          THEN
            WRITE(F1, Ch3)
        END
    END;
  WHILE NOT (EOLN(F2))
  DO
    BEGIN
      WRITE(F1, Ch2);
      READ(F2, Ch2);
      IF EOLN(F2)
      THEN
        WRITE(F1, Ch2)
    END;
  WHILE NOT (EOLN(F3))
  DO
    BEGIN
      WRITE(F1, Ch3);
      READ(F3, Ch3);
      IF EOLN(F3)
      THEN
        WRITE(F1, Ch3)
    END;
  WRITELN(F1)
END; {Merge}

BEGIN
  REWRITE(F2);
  RCopy(INPUT, F2);
  READLN;
  REWRITE(F3);
  RCopy(INPUT, F3);
  READLN;
  Merge(F1, F2, F3);
  RESET(F1);
  RCopy(F1, OUTPUT);
END.

