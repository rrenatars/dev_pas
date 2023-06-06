PROGRAM SplitTest(INPUT, OUTPUT);
VAR
  F1, F2: TEXT;
  
PROCEDURE CopyFile(VAR InFile, OutFile: TEXT);
VAR
  Ch: CHAR;   
BEGIN{CopyFile}
  WHILE NOT EOLN(InFile)
  DO
    BEGIN
      READ(InFile, Ch);
      WRITE(OutFile, Ch)
    END;
  WRITELN(OutFile)
END;{CopyFile}

PROCEDURE Split(VAR F1, F2, F3: TEXT);
{��������� F1 �� F2, F3}
VAR 
  Ch, Switch: CHAR;
BEGIN {Split}
  RESET(F1);
  REWRITE(F2);
  REWRITE(F3);
  {���������� F1 ����������� � F2 � F3}
  Switch := '2';
  WHILE NOT (EOLN(F1))
  DO
    BEGIN
      READ(F1, Ch);
      IF (Switch = '2')
      THEN
        BEGIN
          WRITE(F2, Ch);
          Switch := '3'
        END
      ELSE
        BEGIN
          WRITE(F3, Ch);
          Switch := '2'
        END
    END;
  WRITELN(F2);
  WRITELN(F3);
END; {Split}

BEGIN  {SplitTest}
  Split(INPUT, F1, F2);
  RESET(F1);
  CopyFile(F1, OUTPUT);
  RESET(F2);
  CopyFile(F2, OUTPUT)
END.  {SplitTest}





