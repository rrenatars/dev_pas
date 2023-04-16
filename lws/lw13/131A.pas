PROGRAM RunBubbleSort(INPUT, OUTPUT);
VAR
  F1: TEXT;
{Сортируем первую строку INPUT в OUTPUT}

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
  {Копируем INPUT в F1}
  REWRITE(F1);
  CopyFile(INPUT, F1);
  Sorted := 'N';
  WHILE Sorted = 'N'
  DO
    BEGIN
      Sorted := 'Y';
      {Копируем F1 в F2, проверяя отсортированность
       и переставляя первые соседние символы по порядку}
      {Копируем F2 в F1 }
    END;
  RESET(F1);
  {Копируем F1 в OUTPUT}
  CopyFile(F1, OUTPUT)
END.{RunBubbleSort}   
