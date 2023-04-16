PROGRAM Encryption(INPUT, OUTPUT);
{Переводит символы из INPUT в код согласно Chiper 
  и печатает новые символы в OUTPUT}
CONST
  Len = 20;
TYPE
  Str = ARRAY [1 .. Len] OF CHAR;  
  Chiper = ARRAY [' ' .. 'Z'] OF CHAR;
  SetChar = SET OF CHAR;
VAR
  Msg: Str;
  Code: Chiper;
  I: INTEGER;
  F: TEXT;
  SymbolSet: SetChar;

PROCEDURE Initialize(VAR FIn: TEXT; VAR Code: Chiper);
VAR
  Key, Value: CHAR;
{Присвоить Code шифр замены}
BEGIN {Initialize}
  {Code['A'] := 'Z';}
  RESET(FIn);
  WHILE NOT EOF(FIn)
  DO
    BEGIN
      READ(FIn, Key);
      READ(FIn, Value);
      SymbolSet := SymbolSet + [Value];
      READLN(FIn);
      Code[Value] := Key
    END
END;  {Initialize}

PROCEDURE Encode(VAR S: Str);
{Выводит символы из Code, соответствующие символам из S}
VAR
  Index: 1 .. I;
BEGIN {Encode}
  FOR Index := 1 TO I
  DO
    IF S[Index] IN SymbolSet
    THEN
      WRITE(Code[S[Index]], '++')
    ELSE
      WRITE(S[Index]);
  WRITELN
END;  {Encode}

BEGIN {Encryption}
  ASSIGN(F, 'Encryption.txt');
  {Инициализировать Code}
  WHILE NOT EOF
  DO
    BEGIN
      {читать строку в Msg и распечатать ее}
      I := 0;
      WHILE NOT EOLN AND (I < Len)
      DO
        BEGIN
          I := I + 1;
          READ(Msg[I]);
          WRITE(Msg[I], '==');
        END;
      READLN;
      WRITELN;
      Initialize(F, Code);
      {распечатать кодированное сообщение}
      IF I > 0
      THEN
        Encode(Msg)
    END
END.  {Encryption}

