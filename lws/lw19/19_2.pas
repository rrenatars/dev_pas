PROGRAM SortDate(INPUT, OUTPUT);
USES Date;
TYPE
  Month = (NoMonth, Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec);
  DayNum = 1..31;
  Date   = RECORD
             Mo : Month;
             Day: DayNum
           END;
  FileOfDate = FILE OF Date;
VAR
  Copying: BOOLEAN;
  D, VarDate: Date;
  TFile, DateFile: FileOfDate;
  FInput: TEXT;


BEGIN{SortDate}
  ASSIGN(DateFile, 'DF.DAT');
  ASSIGN(TFile, 'TF.DAT');
  ASSIGN(FInput, 'FI.TXT');
  REWRITE(DateFile);
  RESET(FInput);
  ReadDate(FInput, VarDate);
  READLN(FInput);
  WRITE(DateFile, VarDate);
  RESET(DateFile);
  WHILE NOT EOF(FInput)
  DO
    {Поместить новую дату в DateFile в соответстующее место}
    BEGIN
      ReadDate(FInput,D);
      READLN(FInput);
      IF (D.Mo <> NoMonth)
      THEN
        BEGIN
          {Копируем элементы меньште, чем D из DateFile в TFile}
          REWRITE(TFile);
          Copying := TRUE;
          WHILE NOT EOF(DateFile) AND Copying
          DO
            BEGIN
              READ(DateFile, VarDate);
              IF Less(VarDate,D)
              THEN
                WRITE(TFile, VarDate)
              ELSE
                Copying := FALSE
            END;
          {Копируем D в TFile}
          WRITE(TFile, D);
          {Копируем остаток DateFile в TFile}
          RESET(TFile);
          CopyOut(DateFile);
          {Копируем TFile в DateFile}
      END
  END;
  {Копируем DateFile в OUTPUT}
  RESET(DateFile);
  CopyOut(DateFile);
END.{SortDate}

