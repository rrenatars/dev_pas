PROGRAM Encryption(INPUT, OUTPUT);
{Переводит символы из INPUT в код согласно Chiper 
  и печатает новые символы в OUTPUT}
CONST
  Len = 20;
TYPE
  Str = ARRAY [1 .. Len] OF CHAR;
  Chiper = ARRAY ['A' .. 'Z'] OF CHAR;
VAR
  Msg: Str;
  Code: Chiper;
  I: INTEGER;
  F: TEXT;

PROCEDURE Initialize(VAR FIn: TEXT; VAR Code: Chiper);
VAR
  Key, Value: CHAR;
  I: INTEGER;
{Присвоить Code шифр замены}
BEGIN {Initialize}
  {Code['A'] := 'Z';}
  RESET(FIn);
  WHILE NOT EOLN(FIn)
  DO
    BEGIN
      FOR I := 1 TO 26
      DO
        BEGIN
          READ(FIn, Key);
          READ(FIn, Value);
          READ(FIn, Value);
          READLN(FIn);
          Code[Key] := Value
        END
    END
END;  {Initialize}

BEGIN
  ASSIGN(F, 'Encryption.txt');
  Initialize(F, Code)
END.
