PROGRAM Reverse(INPUT, OUTPUT);
PROCEDURE ReverseProc(VAR F: TEXT);
VAR
  Ch: CHAR;                  
BEGIN {ReverseProc}
  IF NOT EOLN(F)
  THEN
    BEGIN
      READ(F, Ch);
      ReverseProc(F);
      WRITE(OUTPUT, Ch)
    END
END; {ReverseProc}

BEGIN {Reverse}
  ReverseProc(INPUT);
  WRITELN
END.
  
