PROGRAM Encryption(INPUT, OUTPUT);
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

PROCEDURE Initialize(VAR FIn: TEXT; VAR Code: Chiper);
VAR
  Key, Value: CHAR;
  I: INTEGER;
{��������� Code ���� ������}
BEGIN {Initialize}
  RESET(FIn); 
  WHILE NOT EOLN(FIn)
  DO
    BEGIN
      WHILE NOT EOF(FIn)
      DO
        BEGIN
          READ(FIn, Key);
          IF Key IN ['A' .. 'Z', ' ']
          THEN
            BEGIN
              READ(FIn, Value);
              READ(FIn, Value);
              READLN(FIn);
              Code[Key] := Value
            END 
        END
    END
END;  {Initialize}

PROCEDURE Encode(VAR S: Str);
{������� ������� �� Code, ��������������� �������� �� S}
VAR
  Index: 1 .. I;
BEGIN {Encode}
  FOR Index := 1 TO I
  DO
    IF S[Index] IN [' ', 'A' .. 'Z']
    THEN
      WRITE(Code[S[Index]])
    ELSE  
      WRITE(S[Index]);
  WRITELN
END;  {Encode}

BEGIN {Encryption}
  ASSIGN(F, 'Encryption.txt');
  {���������������� Code}
  Initialize(F, Code);
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
        Encode(Msg)
    END
END.  {Encryption}

