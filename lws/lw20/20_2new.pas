PROGRAM PsevdoGraphic(INPUT, OUTPUT);
CONST
  SetOfValidChars = [' ', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'];
TYPE
  Positions = SET OF 1 .. 250; 
VAR
  Ch, FCh: CHAR;
  Matrix, PositionsSet: Positions; 
  CounterOfReadChars, PositionsCounter, PositionsString: INTEGER; 
  F: TEXT;
  IsValidLetter: BOOLEAN;
  
  
FUNCTION ReadLetter(VAR FIn: TEXT; VAR Ch: CHAR): BOOLEAN;
BEGIN
  READ(FIn, Ch);
  IF Ch IN SetOfValidChars
  THEN
    ReadLetter := TRUE
  ELSE
    ReadLetter := FALSE 
END;
  
FUNCTION ChooseMatrix(VAR F: TEXT; VAR Ch: CHAR): Positions; 
VAR
  FCh: CHAR;
  FPositions: INTEGER;
  PositionsOfLetterSet: Positions;
BEGIN
  PositionsOfLetterSet := [];
  RESET(F);
  READ(F, FCh);
  WHILE Ch <> FCh
  DO
    READ(F, FCh);
  WHILE NOT EOLN(F)
  DO
    BEGIN
      READ(F);
      READ(F, FPositions);
      PositionsOfLetterSet := PositionsOfLetterSet + [FPositions]
    END;
  ChooseMatrix := PositionsOfLetterSet
END;              
                  
PROCEDURE PrintMatrix(PositionsOfLetterSet: Positions);
VAR                
  Position: INTEGER;
BEGIN      
  FOR Position := 1 TO 255
  DO
    BEGIN
      IF Position IN PositionsOfLetterSet
      THEN
        WRITE('&')
      ELSE
        WRITE(' ');
      IF Position MOD 5 = 0
      THEN
        WRITE(' ');
      IF Position MOD 50 = 0
      THEN 
        WRITELN
    END
END;     

BEGIN
  ASSIGN(F, 'Chars.txt');
  CounterOfReadChars := 0;
  IsValidLetter := FALSE;
  WHILE (NOT EOLN) AND (CounterOfReadChars < 11)
  DO
    BEGIN 
      IF ReadLetter(INPUT, Ch)
      THEN
        BEGIN
          IsValidLetter := TRUE;
          Matrix := ChooseMatrix(F, Ch);
          CounterOfReadChars := CounterOfReadChars + 1;
          FOR PositionsString := 0 TO 4
          DO
            BEGIN
              FOR PositionsCounter := (1 + (5 * PositionsString)) TO (5 * (PositionsString + 1))
              DO
                BEGIN
                  IF PositionsCounter IN Matrix
                  THEN
                    PositionsSet := PositionsSet + [PositionsCounter - (5 * PositionsString) + 5 * (CounterOfReadChars - 1) + (50 * PositionsString)]
                END
            END   
        END
      ELSE
        IsValidLetter := FALSE
    END;
  IF IsValidLetter
  THEN
    PrintMatrix(PositionsSet)
  ELSE
    WRITELN('Некорректные данные')
END.



