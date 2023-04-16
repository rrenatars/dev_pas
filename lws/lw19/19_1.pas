PROGRAM PrimeNumbers(INPUT, OUTPUT);
CONST
  Max = 20;
TYPE
  IntSet = SET OF 2 .. Max;
VAR
  Current, NumberInSet: INTEGER;
  S1: IntSet;
BEGIN
  S1 := [2 .. Max];
  Current := 2;
  WHILE Current <= Max
  DO
    BEGIN
      NumberInSet := Current + 1;
      WHILE NumberInSet <= Max
      DO
        BEGIN
          IF (NumberInSet mod Current = 0)
          THEN
            S1 := S1 - [NumberInSet];
          NumberInSet := NumberInSet + 1
        END;
     Current := Current + 1
   END; 
  Current := 2;
  WHILE Current <= Max
  DO
    BEGIN
      IF Current IN S1
      THEN
        WRITELN(Current);
      Current := Current + 1
    END
END.
