PROGRAM RunBubbleSort(INPUT, OUTPUT);
VAR
  F1: TEXT;
{��������� ������ ������ INPUT � OUTPUT}

PROCEDURE CopyFile(VAR InFile, OutFile: TEXT);
VAR
  Ch: CHAR;
BEGIN {CopyFile} 
  WHILE NOT EOLN(InFile)
  DO
    BEGIN
      READ(InFile, Ch);
      WRITE(OutFile, Ch)
    END;
  WRITELN(OutFile)
END;{CopyFile}

BEGIN {RunBubbleSort}
  {�������� INPUT � F1}
  REWRITE(F1);
  CopyFile(INPUT, F1);
  Sorted := 'N';
  WHILE Sorted = 'N'
  DO
    BEGIN
      Sorted := 'Y';
      {�������� F1 � F2, �������� �����������������
       � ����������� ������ �������� ������� �� �������}
      {�������� F2 � F1 }
    END;
  RESET(F1);
  {�������� F1 � OUTPUT}
  CopyFile(F1, OUTPUT)
END.{RunBubbleSort}   
