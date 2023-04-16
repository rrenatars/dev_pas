PROGRAM PsevdoGraphic(INPUT, OUTPUT);
CONST
  SetOfValidChars = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'];
TYPE
  Positions = SET OF 1 .. 60; 
VAR
  Ch: CHAR;
  Matrix, PositionsSet: Positions; 
  CounterOfReadChars, PositionsCounter, PositionsString: INTEGER; 
  
  
FUNCTION ReadLetter(VAR FIn: TEXT; VAR Ch: CHAR): BOOLEAN;
BEGIN
  READ(FIn, Ch);
  IF Ch IN SetOfValidChars
  THEN
    ReadLetter := TRUE
  ELSE
    ReadLetter := FALSE 
END;
  
FUNCTION ChooseMatrix(Ch: CHAR): Positions; 
BEGIN
  CASE Ch OF
    'A': ChooseMatrix := [3, 7, 9, 11 .. 15, 16, 20, 21, 25]; 
    'B': ChooseMatrix := [1 .. 6, 10 .. 16, 20 .. 25];
    'C': ChooseMatrix := [2 .. 6, 11, 16, 22 .. 25];
    'D': ChooseMatrix := [1 .. 4, 6, 10, 11, 15, 16, 20 .. 24];
    'E': ChooseMatrix := [1 .. 6, 11 .. 16, 21 .. 25];
    'F': ChooseMatrix := [1 .. 6, 11 .. 16, 21];
    'G': ChooseMatrix := [2 .. 5, 6, 11, 13 .. 16, 20, 22 .. 25];
    'H': ChooseMatrix := [1, 5, 6, 10 .. 16, 20, 21, 25];
    'I': ChooseMatrix := [2 .. 4, 8, 13, 18, 22 .. 24];
    'J': ChooseMatrix := [3 .. 5, 10, 15, 16, 20, 22 .. 25];
    'K': ChooseMatrix := [1, 5, 6, 9, 11, 12, 16, 19, 21, 25];
    'L': ChooseMatrix := [1, 6, 11, 16, 21, 22, 23, 24, 25];
    'M': ChooseMatrix := [1, 5, 6, 7, 9, 10, 11, 13, 15, 16, 20, 21, 25]; 
    'N': ChooseMatrix := [1, 5, 6, 7, 10, 11, 13, 15, 16, 19, 20, 21, 25];
    'O': ChooseMatrix := [2, 3, 4, 6, 9, 13, 16, 19, 22, 23, 24];
    'P': ChooseMatrix := [1, 2, 3, 6, 8, 11, 12, 13, 16, 21];
    'Q': ChooseMatrix := [12, 13, 16, 18, 19, 22, 24];
    'R': ChooseMatrix := [1, 2, 3, 6, 8, 11, 12, 13, 16, 18, 21, 23, 24, 25];
    'S': ChooseMatrix := [2, 3, 7, 8, 9, 13, 17, 18, 19, 23, 24];
    'T': ChooseMatrix := [1, 2, 3, 4, 5, 9, 14, 19, 24];
    'U': ChooseMatrix := [1, 6, 11, 16, 21, 22, 23, 24, 25];
    'V': ChooseMatrix := [1, 6, 10, 12, 15, 19, 24];
    'W': ChooseMatrix := [1, 6, 7, 11, 13, 16, 18, 20, 22, 23, 24, 25];
    'X': ChooseMatrix := [1, 5, 7, 9, 15, 19, 21, 23];
    'Y': ChooseMatrix := [1, 5, 7, 9, 13, 14, 15, 19, 24];
    'Z': ChooseMatrix := [1 .. 5, 9, 13, 17, 21 .. 25] 
  END
END;    

PROCEDURE PrintMatrix(LetterSet: Positions);
VAR                
  PositionsCounter: INTEGER;
BEGIN      
  FOR PositionsCounter := 1 TO 60
  DO
    BEGIN
      IF PositionsCounter IN LetterSet
      THEN
        WRITE('@')
      ELSE
        WRITE(' ')
    END 
END; 

BEGIN
  {WHILE NOT EOLN
  DO
    BEGIN
      IF ReadLetter(INPUT, Ch)
      THEN
        BEGIN
          Matrix := ChooseMatrix(Ch);
          PrintMatrix(Matrix);
          WRITELN
        END
      ELSE
        WRITELN('Iaei??aeoiua aaiiua')
    END;
  WRITELN   }
  CounterOfReadChars := 0;
  WHILE NOT EOLN
  DO
    BEGIN 
      IF ReadLetter(INPUT, Ch)
      THEN
        BEGIN
          Matrix := ChooseMatrix(Ch);
          CounterOfReadChars := CounterOfReadChars + 1;
          FOR PositionsString := 0 TO 4
          DO
            BEGIN          
              FOR PositionsCounter := 1 + 5 * PositionsString TO 5 * (PositionsString + 1)
              DO
                BEGIN
                  IF PositionsCounter IN Matrix
                  THEN
                    PositionsSet := PositionsSet + [PositionsCounter - (5 * PositionsString) + 5 * (CounterOfReadChars - 1) + (CounterOfReadChars - 1)]
                END;
              PrintMatrix(PositionsSet);
              WRITE('+++');
              WRITELN;
              PositionsSet := []
            END
        END
      ELSE
        WRITELN('Некорректные данные')
    END
END.
