PROGRAM RunBubbleSort(INPUT, OUTPUT);
VAR
  Sorted, Ch: CHAR;
  F1, F2: TEXT;

PROCEDURE CopyFile(VAR InFile, OutFile: TEXT);
VAR
  Ch: CHAR;
BEGIN { �������� InFile � OutFile }
  WHILE NOT EOLN(InFile)
  DO
    BEGIN
      READ(InFile, Ch);
      WRITE(OutFile, Ch)
    END;
  WRITELN(OutFile)
END;

BEGIN { BubbleSort }
  REWRITE(F1);
  CopyFile(INPUT, F1);
  Sorted := 'N';
  WHILE Sorted = 'N'
  DO
    BEGIN
      Sorted := 'Y'       
      { �������� F1 � F2, �������� �����������������
       � ����������� ������ �������� �������� �� �������}
      { �������� F2 � F1 }
    END;
  RESET(F1);
  CopyFile(F1, OUTPUT)
END.{ BubbleSort }


