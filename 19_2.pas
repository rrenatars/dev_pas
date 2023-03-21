PROGRAM SortDate(INPUT, OUTPUT);
USES Date;
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
    {��������� ����� ���� � DateFile � ��������������� �����}
    BEGIN
    ReadDate(FInput,D);
    READLN(FInput);
    IF (D.Mo <> NoMonth)
    THEN
      BEGIN
        {�������� �������� �������, ��� D �� DateFile � TFile}
        BEGIN
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
          END
      END;
        {�������� D � TFile}
        WRITE(TFile, D);
        {�������� ������� DateFile � TFile}
        
        {�������� TFile � DateFile}
      END;
  END;

  {�������� DateFile � OUTPUT}
  RESET(DateFile);
  CopyOut(DateFile);

END.{SortDate}

