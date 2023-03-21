PROGRAM Prime(INPUT, OUTPUT);
CONST
  Max = 100;
TYPE
  IntSet = SET OF 2 .. Max;
VAR
  Num, NumSet: INTEGER;
  S1: IntSet;
BEGIN
  S1 := [2 .. Max];
  Num := 2;
  WHILE Num <> Max
  DO
    BEGIN
      NumSet := Num;
      WHILE NumSet <= Max 
      DO
        BEGIN
          S1 := S1 - [NumSet];
          NumSet := NumSet + Num
        END;
      WRITELN(Num);
      WHILE (NOT(Num IN S1)) AND (Num < Max)
      DO
        Num := Num + 1   
    END
END.
      
  
          
             
