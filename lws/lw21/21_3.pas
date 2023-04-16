PROGRAM Decryption(INPUT, OUTPUT);
{��������� ������� �� INPUT � ��� �������� Chiper 
  � �������� ����� ������� � OUTPUT}
CONST
  Len = 20;
TYPE
  Str = ARRAY [1 .. Len] OF CHAR;  
  Chiper = ARRAY [' ' .. 'Z'] OF CHAR;
VAR
  Msg: Str;
  Code: Chiper;
  I: INTEGER;
  F: TEXT;

PROCEDURE InitializeDecode(VAR FIn: TEXT; VAR Code: Chiper);
VAR
  Key, Value: CHAR;
{��������� Code ���� ������}
BEGIN {Initialize}
  RESET(FIn);
  WHILE NOT EOF(FIn)
  DO
    BEGIN
      READ(FIn, Key);
      READLN(FIn, Value);
      Code[Value] := Key
    END 
END;  {Initialize}

PROCEDURE Decode(VAR S: Str; VAR I: INTEGER);
{������� ������� �� Code, ��������������� �������� �� S}
VAR
  Index: 1 .. I;
BEGIN {Encode}
  FOR Index := 1 TO I
  DO
    IF S[Index] IN CHAR
    THEN 
      WRITE(Code[S[Index]])
    ELSE
      WRITE(S[Index]);
  WRITELN
END;  {Encode}

BEGIN {Encryption}
  ASSIGN(F, 'Encryption.txt');
  {���������������� Code}
  InitializeDecode(F, Code);
  WHILE NOT EOF
  DO
    BEGIN
      {������ ������ � Msg � ����������� ��}
      I := 0;
      WHILE NOT EOLN AND (I < Len)
      DO
        BEGIN
          I := I + 1;
          READ(Msg[I]);
          WRITE(Msg[I])
        END;
      READLN;
      WRITELN;
      {����������� ������������ ���������}
      IF I > 0
      THEN
        Decode(Msg, I)
    END
END.  {Encryption}


