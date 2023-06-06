PROGRAM RunLexico(INPUT, OUTPUT);
VAR
  Result: CHAR;
  F1, F2: TEXT;
  
PROCEDURE Lexico(VAR F1, F2: TEXT; VAR Result: CHAR);
VAR
  Ch1, Ch2: CHAR;
BEGIN {Lexico}
  RESET(F1);
  RESET(F2);
  Result := '0';
  WHILE (NOT EOLN(F1)) AND (NOT EOLN(F2)) AND (Result = '0')
  DO
    BEGIN {WHILE}
      READ(F1, Ch1);
      READ(F2, Ch2);
      IF (Ch1 < Ch2) OR ((Ch1 = Ch2) AND (EOLN(F1)) AND (NOT EOLN(F2)))
      THEN 
        Result := '1'
      ELSE
        IF (Ch1 > Ch2) OR ((Ch1 = Ch2) AND (NOT EOLN(F1)) AND (EOLN(F2)))
        THEN 
          Result := '2'
    END {WHILE}
END; {Lexico}  

BEGIN{DeBug}
  ASSIGN(F1, 'F1.txt');
  ASSIGN(F2, 'F2.txt');
  Lexico(F1, F2, RESULT);
  WRITELN(Result)
END.{DeBug}
