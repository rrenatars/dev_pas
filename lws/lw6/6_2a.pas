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
      WRITELN(Next);
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
  WRITELN(Evens, '#')
  {���������� Odds � OUTPUT}
  {���������� Evens � OUTPUT}
END.
