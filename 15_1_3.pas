PROGRAM Reversive(INPUT, OUTPUT);
USES Count3;
VAR
  V1, V10, V100, Ch: CHAR;
BEGIN
  Start;
  WHILE NOT EOLN
  DO 
    BEGIN
      READ(Ch);
      IF Ch = ' '
      THEN
        Bump
    END;
  Value(V1, V2, V100);
  WRITELN('Во входном файле', V100, V10, V1, 'пробелов')
END.
