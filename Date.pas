UNIT Date;
INTERFACE
  TYPE
    Month = (NoMonth, JAN, FEB, MAR, APR, MAY, JUN, JUL, AUG, SEP, OCT, NOV, DEC);
    DayNum = 1..31;
    Date   = RECORD
               Mo : Month;
               Day: DayNum
             END;
    FileOfDate = FILE OF Date;
  PROCEDURE ReadMonth(VAR FIn: TEXT; VAR Mo: Month); {������ ��������� �����}
  PROCEDURE WriteMonth(VAR FOut: TEXT; VAR Mo: Month); {������� �����}
  PROCEDURE WriteDate(VAR FOut: TEXT; VAR Res: Date);
  PROCEDURE ReadDate(VAR FIn: TEXT; VAR Res: Date);

IMPLEMENTATION
PROCEDURE WriteDate(VAR FOut: TEXT; VAR Res: Date);
BEGIN{WriteDate}
  WriteMonth(FOut,Res.Mo);
  WRITE(FOut,Res.Day:3)
END;{WriteDate}

PROCEDURE ReadDate (VAR FIn: TEXT; VAR Res: Date);
BEGIN{ReadDate}
  ReadMonth(FIn,Res.Mo);
  READ(FIn,Res.Day)
END;{ReadDate}

PROCEDURE ReadMonth(VAR FIn: TEXT; VAR Mo: Month);
VAR
  Ch1, Ch2, Ch3: CHAR;
BEGIN{ReadMonth}
  READ(FIn, Ch1, Ch2, Ch3);
  IF (Ch1 = 'J') AND (Ch2 = 'A') AND (Ch3 = 'N') THEN Mo := Jan ELSE
  IF (Ch1 = 'F') AND (Ch2 = 'E') AND (Ch3 = 'B') THEN Mo := Feb ELSE
  IF (Ch1 = 'M') AND (Ch2 = 'A') AND (Ch3 = 'R') THEN Mo := Mar ELSE
  IF (Ch1 = 'A') AND (Ch2 = 'P') AND (Ch3 = 'R') THEN Mo := Apr ELSE
  IF (Ch1 = 'M') AND (Ch2 = 'A') AND (Ch3 = 'Y') THEN Mo := May ELSE
  IF (Ch1 = 'J') AND (Ch2 = 'U') AND (Ch3 = 'N') THEN Mo := Jun ELSE
  IF (Ch1 = 'J') AND (Ch2 = 'U') AND (Ch3 = 'L') THEN Mo := Jul ELSE
  IF (Ch1 = 'A') AND (Ch2 = 'U') AND (Ch3 = 'G') THEN Mo := Aug ELSE
  IF (Ch1 = 'S') AND (Ch2 = 'E') AND (Ch3 = 'P') THEN Mo := Sep ELSE
  IF (Ch1 = 'O') AND (Ch2 = 'C') AND (Ch3 = 'T') THEN Mo := Oct ELSE
  IF (Ch1 = 'N') AND (Ch2 = 'O') AND (Ch3 = 'V') THEN Mo := Nov ELSE
  IF (Ch1 = 'D') AND (Ch2 = 'E') AND (Ch3 = 'C') THEN Mo := Dec
    ELSE Mo := NoMonth
END;{ReadMonth}

PROCEDURE WriteMonth(VAR FOut: TEXT; VAR Mo: Month);
VAR
  Ch1, Ch2, Ch3: CHAR;
BEGIN {WriteMonth}
  IF Mo = Jan THEN WRITE('JAN') ELSE
  IF Mo = Feb THEN WRITE('FEB') ELSE
  IF Mo = Mar THEN WRITE('MAR') ELSE
  IF Mo = Apr THEN WRITE('APR') ELSE
  IF Mo = May THEN WRITE('MAY') ELSE
  IF Mo = Jun THEN WRITE('JUN') ELSE
  IF Mo = Jul THEN WRITE('JUL') ELSE
  IF Mo = Aug THEN WRITE('AUG') ELSE
  IF Mo = Sep THEN WRITE('SEP') ELSE
  IF Mo = Oct THEN WRITE('OCT') ELSE
  IF Mo = Nov THEN WRITE('NOV') ELSE
  IF Mo = Dec THEN WRITE('DEC')
    ELSE WRITE('NoMonth')
END; {WriteMonth}

BEGIN
END.

    
