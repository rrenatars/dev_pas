PROGRAM RunLexico(INPUT, OUTPUT);
VAR
  F1, F2: TEXT;
  Result: CHAR;

PROCEDURE CopyFile(VAR InFile, OutFile: TEXT);
VAR
  Ch: CHAR;
BEGIN
  RESET(InFile);
  REWRITE(OutFile);
  WHILE NOT EOLN(InFile)
  DO
    BEGIN
      READ(InFile, Ch);
      WRITE(OutFile, Ch)
    END;
  WRITELN(OutFile)
END;

PROCEDURE LineToFile(VAR InFile, F1, F2: TEXT);
VAR
  Ch, Flag: CHAR;
BEGIN {LineToFile}
  Reset(InFile);
  Rewrite(F1);
  Rewrite(F2);
  Flag := '0';
  WHILE NOT EOLN(InFile)
  DO
    BEGIN
      READ(InFile, Ch);
      IF (Ch = ' ') AND (Flag = '0') AND (NOT EOLN(InFile))
      THEN
        BEGIN
          READ(InFile, Ch);
          Flag := '1'
        END;
      IF (Ch <> ' ') AND (Flag = '0')
      THEN
        WRITE(F1, Ch);
      IF (Ch = ' ') AND (Flag = '1') AND (NOT EOLN(InFile))
      THEN
        READ(InFile, Ch);
      IF (Ch <> ' ') AND (Flag = '1')
      THEN
        WRITE(F2, Ch)      
    END
END; {LineToFile}

PROCEDURE Lexico(VAR F1, F2: TEXT; VAR Result: CHAR);
{Result 0, 1, 2 если лексикографический порядок F1 =, <, > чем F2       
соответственно. Фактические параметры, соответствующие F1 и F2,
должны быть различными}
VAR
  Ch1, Ch2: CHAR;
BEGIN {Lexico}
  RESET(F1);
  RESET(F2);
  Result := '0';
  WHILE (NOT EOLN(F1) AND NOT EOLN(F2)) AND (Result = '0')
  DO
    BEGIN
      READ(F1, Ch1);
      READ(F2, Ch2);
      IF (Ch1 < Ch2)
      THEN {Ch1 < Ch2 или F1 короче F2}
        BEGIN
          Result := '1';
          WRITELN('1111111111')
        END
      ELSE
        IF (Ch1 > Ch2)
        THEN {Ch1 > Ch2 или F2 короче F1}
          BEGIN
            Result := '2';
            WRITELN('2222222')
          END
    END {WHILE}
END; {Lexico}

BEGIN
  LineToFile(INPUT, F1, F2);
  Lexico(F1, F2, Result);
  WRITELN(Result)
END.
