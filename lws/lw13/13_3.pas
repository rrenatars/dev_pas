PROGRAM Split(INPUT,OUTPUT);
  {�������� INPUT � OUTPUT, ������� ��������, � ����� ������
   ��������}
VAR
  Ch, Next: CHAR;
  Odds, Evens: TEXT;

PROCEDURE CopyOut(VAR F1: TEXT; VAR Ch: CHAR);
BEGIN
  {�������� F1 � OUTPUT}
  RESET(F1);
  WHILE NOT EOF(F1)
  DO
    BEGIN
      WHILE NOT EOLN(F1)
      DO
        BEGIN
          READ(F1, Ch);
          WRITE(OUTPUT, Ch)
        END;
      READLN(F1)  
    END
END;

BEGIN
  {��������� INPUT � Odds � Evens}
  REWRITE(Odds);
  REWRITE(Evens);
  Next := 'O';
  WHILE NOT EOF
  DO
    BEGIN
      WHILE NOT EOLN
      DO
        BEGIN
          {��������� Ch, �������� � ����, ��������� �����
          Next, ����������� Next}
          READ(Ch);
          IF Next = 'O'
          THEN
            BEGIN
              Next := 'E';
              WRITE(Odds, Ch)
            END  
          ELSE
            BEGIN
              Next := 'O';
              WRITE(Evens, Ch)
            END 
        END;   
      READLN
    END;
  WRITELN(Odds);
  WRITELN(Evens);
  CopyOut(Odds, Ch);
  CopyOut(Evens, Ch);
  WRITELN
END.

