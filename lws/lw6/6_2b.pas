PROGRAM Split(INPUT, OUTPUT);
VAR
  Ch, Next: CHAR;
  Odds, Evens: TEXT;
BEGIN
  {������� INPUT �� Odds � Evens}
  REWRITE(Odds);
  REWRITE(Evens);
  Next := 'O';
  READ(INPUT, Ch);
  WHILE Ch <> '#'
  DO
    BEGIN
      IF NEXT = 'O'
      THEN
        BEGIN
          WRITELN(Odds, Ch);
          Next := 'E'
        END
      ELSE
        BEGIN
          WRITELN(Evens, Ch);
          Next := 'O'
        END;
      READ(INPUT, Ch)
    END;
  WRITELN(Odds, '#');
  WRITELN(Evens, '#');

  {���������� Odds � OUTPUT}
            RESET(Odds);
            READ(Odds, Ch);
            WHILE Ch <> '#'
            DO
              BEGIN
                WRITE(OUTPUT, Ch);
                READ(Odds, Ch)
              END;
            WRITELN(OUTPUT)
  {���������� Evens � OUTPUT}
END.
