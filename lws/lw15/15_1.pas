PROGRAM Reverse(INPUT, OUTPUT);
USES Count3;
VAR
  V1, V10, V100, W1, W2, W3: CHAR;
BEGIN {CountReverses}
  Start;
  WRITE('Вход:');
  IF NOT EOLN
  THEN
    BEGIN
      READ(W1);
      IF NOT EOLN
      THEN
        BEGIN
          READ(W2);
          WHILE NOT EOLN
          DO
            BEGIN
              READ(W3);
              IF ((W2 > W1) AND (W2 > W3)) OR ((W2 < W1) AND (W2 < W3))
              THEN
                Bump;
              W1 := W2;
              W2 := W3
            END
        END
    END;
  Value(V100, V10, V1);
  WRITELN('Количество реверсов ', V100, V10, V1)
END. {CountReverses}
