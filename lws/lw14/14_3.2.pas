PROGRAM MergeSort(INPUT, OUTPUT);

PROCEDURE CopyOut(VAR F1: TEXT; VAR Ch: CHAR);
BEGIN
  RESET(F1);
  WHILE NOT EOF(F1)
  DO
    BEGIN
      WHILE NOT EOLN(F1)
      DO
        BEGIN
          READ(F1, Ch);
          WRITE(OUTPUT, Ch)
        END;
      READLN(F1)
    END
END;

PROCEDURE Split(VAR F1: TEXT);
{Разбивает F1 на F2, F3}
VAR
  F2, F3: TEXT;
  Ch, Next: CHAR;
BEGIN
  REWRITE(F2);
  REWRITE(F3);
  Next := '0';
  WHILE NOT EOF(INPUT)
  DO
    BEGIN
      WHILE NOT EOLN(INPUT)
      DO
        BEGIN
          READ(INPUT, Ch); 
          IF Next = '0'
          THEN
            BEGIN
              WRITE(F2, Ch);
              Next := '1'
            END
          ELSE
            BEGIN
              WRITE(F3, Ch);
              Next := '0'
            END
        END;
        READLN;
        WRITELN(F2);
        WRITELN(F3)
    END;
  WRITELN(F2);         
  WRITELN(F3);
  CopyOut(F2, Ch);
  CopyOut(F3, Ch);
  WRITELN
END;

BEGIN {MergeSort}
  Split(INPUT)
END. {MergeSort}




