PROGRAM CountBlanks(INPUT, OUTPUT);
USES Count3;
VAR
  Ch, V1, V10, V100: CHAR;
BEGIN {CountBlanks}
  Start;
  WHILE NOT EOLN
  DO
    BEGIN
      READ(Ch);
      IF Ch = ' '
      THEN
        Bump
    END;
  Value(V100, V10, V1);
  WRITELN('Во входном файле ', V100, V10, V1, ' пробелов')
END. {CountBlanks}
