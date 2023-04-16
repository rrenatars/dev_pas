PROGRAM RCopy(INPUT, OUTPUT);

PROCEDURE RCopyProc(VAR F: TEXT);
VAR
  Ch: CHAR;
BEGIN {RCopyProc}
  IF NOT EOLN(F)
  THEN
    BEGIN
      READ(F, Ch);
      WRITE(OUTPUT, Ch);
      RCopyProc(F)
    END
  ELSE
    WRITELN
END; {RCopyProc}

BEGIN {RCopy}
  RCopyProc(INPUT)
END. {RCopy}
