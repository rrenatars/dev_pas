PROGRAM PsevdoGraphic(INPUT, OUTPUT);
TYPE
  Positions = SET OF 1 .. 25;   
VAR     
  LetterSet: Positions;  
  Ch: CHAR;
  
  
PROCEDURE ChooseLetter(Ch: CHAR);
TYPE
  Positions = SET OF 1 .. 25; 
VAR     
  LetterSet: Positions; 
  
BEGIN
  CASE Ch OF
    'M': 
      BEGIN
        LetterSet := [1, 5, 6, 7, 9, 10, 11, 13, 15, 16, 20, 21, 25];
        PrintLetter(LetterSet)
      END;
    'A': 
      BEGIN
        LetterSet := [3, 7, 9, 11 .. 15, 16, 20, 21, 25];
        PrintLetter(LetterSet)
      END;
    'L': 
      BEGIN
        LetterSet := [1, 6, 11, 16, 21 .. 25];
        PrintLetter(LetterSet)
      END
  ELSE
    WRITELN('ERROR')
  END
END;

PROCEDURE PrintLetter(VAR LetterSet: Positions);
CONST
  Height = 5;
  Width = 5;
TYPE
  Positions = SET OF 1 .. 25;       
VAR                
  Position: INTEGER;
BEGIN      
  FOR Position := 1 TO Height * Width
  DO
    BEGIN
      IF Position IN LetterSet
      THEN
        WRITE(Ch)
      ELSE
        WRITE(' ');
      IF Position MOD 5 = 0
      THEN 
        WRITELN
    END
END;

BEGIN
  READ(Ch);
  ChooseLetter(Ch);
  WRITELN
END.
  
  
