PROGRAM StringToNumber(INPUT, OUTPUT);
VAR
  Digit: INTEGER;

PROCEDURE CharToDigit(VAR D: CHAR; VAR Result: INTEGER);
BEGIN
  IF D = '0' THEN Result := 0 ELSE
  IF D = '1' THEN Result := 1 ELSE    
  IF D = '2' THEN Result := 2 ELSE
  IF D = '3' THEN Result := 3 ELSE
  IF D = '4' THEN Result := 4 ELSE
  IF D = '5' THEN Result := 5 ELSE
  IF D = '6' THEN Result := 6 ELSE
  IF D = '7' THEN Result := 7 ELSE
  IF D = '8' THEN Result := 8 ELSE
  IF D = '9' THEN Result := 9 
    ELSE
      Result := -1
END;
  
PROCEDURE ReadDigit(VAR F: TEXT; VAR D: INTEGER);
{��������� ������� ������ �� �����, ���� �� - �����, ���������� ��� ���������� 
� �������� ���� INTEGER, ���� ��������� ������ �� ����� ���������� -1}
VAR 
  Ch: CHAR;
BEGIN                                                                           
  IF (NOT EOLN(F)) AND (D <> -1)
  THEN
    BEGIN
      READ(F, Ch);
      CharToDigit(Ch, D)
    END
END;

PROCEDURE ReadNumber(VAR F: TEXT; VAR N: INTEGER);
{����������� ������ ���� �� ����� �� ������� ����������� �������,
� ��������������� ����� ����� N}  
VAR
  D: INTEGER;
BEGIN
  N := 0;
  WHILE (NOT EOLN(F)) AND (N <> -1) AND (N < MAXINT) AND (N <> -2)
  DO
    BEGIN
      ReadDigit(F, D);
      IF (D <> -1)
      THEN
        BEGIN 
          IF (((MAXINT - D) / 10) >= N)
          THEN
            N := N * 10 + D
          ELSE
            N := -2;
        END;
      IF (D = -1) AND (N = 0) 
      THEN
        N := -1
    END 
END; 

BEGIN
  ReadNumber(INPUT, Digit);
  WRITELN(Digit);
END.
