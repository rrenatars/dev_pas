PROGRAM Recursive(INPUT, OUTPUT);
VAR
  F: TEXT;
  
PROCEDURE Copy(VAR F1, F2: TEXT);
VAR
  Ch: CHAR;
BEGIN {Copy}
  WHILE NOT EOLN(F1)
  DO
    BEGIN
      READ(F1, Ch);
      WRITE(F2, Ch)
    END;
  WRITELN(F2)  
END; {Copy}

PROCEDURE Split(VAR F1, F2, F3: TEXT);
{Разбивает F1 на F2 и F3}
VAR 
  Ch, Switch: CHAR;
BEGIN {Split}
  RESET(F1);
  REWRITE(F2);
  REWRITE(F3);
  {Копировать F1 попеременно в F2 и F3}
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
  WRITELN(F3)
END; {Split}

PROCEDURE Merge(VAR F1, F2, F3: TEXT);
{Сливает F2, F3 в F1  в сортированном порядке}
VAR 
  Ch2, Ch3, EF2, EF3: CHAR;
BEGIN {Merge}
  EF2 := 'N';
  EF3 := 'N';
  RESET(F2);
  RESET(F3);
  REWRITE(F1);
  READ(F2, Ch2);
  READ(F3, Ch3);
  WHILE (EF2 = 'N') OR (EF3 = 'N')
  DO
    BEGIN
      IF ((Ch2 < Ch3) AND (EF2 = 'N')) OR (EF3 = 'Y')
      THEN 
        BEGIN
          WRITE(F1, Ch2);
          WHILE NOT EOLN(F1)
          DO
            BEGIN
              READ(F1, Ch2);
              WRITELN(Ch2)
            END;
          IF NOT EOLN(F2)
          THEN           
            READ(F2, Ch2)
          ELSE
            EF2 := 'Y'
        END
      ELSE
        BEGIN
          WRITE(F1, Ch3);
          IF NOT EOLN(F3)
          THEN
            READ(F3, Ch3)
          ELSE 
            EF3 := 'Y' 
        END
    END;
  WRITELN(F1)
END; {Merge}

PROCEDURE RecursiveSort(VAR F1: TEXT);
VAR 
  F2, F3: TEXT;
  Ch: CHAR;
BEGIN {RecursiveSort}
  RESET(F1);
  IF NOT (EOLN(F1))
  THEN
    BEGIN
      READ(F1, Ch);
      IF NOT (EOLN(F1))
      THEN {Файл имеет как минимум 2 символа}
        BEGIN
          Split(F1, F2, F3);
          RecursiveSort(F2);
          RecursiveSort(F3);
          Merge(F1, F2, F3)
        END
    END
END;   {RecursiveSort}

BEGIN  {Recursive}
  REWRITE(F);
  Copy(INPUT, F);
  RecursiveSort(F);
  RESET(F);
  Copy(F, OUTPUT);
  WRITELN
END.  {Recursive}





