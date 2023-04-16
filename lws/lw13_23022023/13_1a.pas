PROGRAM RunBubbleSort(INPUT, OUTPUT);
VAR
  Sorted, Ch: CHAR;
  F1, F2: TEXT;

PROCEDURE CopyFile(VAR InFile, OutFile: TEXT);
VAR
  Ch: CHAR;
BEGIN { Копируем InFile в OutFile }
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
      { Копируем F1 в F2, проверяя отсортированность
       и переставляя первые соседние символыо по порядку}
      { Копируем F2 в F1 }
    END;
  RESET(F1);
  CopyFile(F1, OUTPUT)
END.{ BubbleSort }


