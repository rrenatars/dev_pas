PROGRAM IFSort3(INPUT, OUTPUT);
VAR
  Ch1, Ch2, Ch3:Char;
BEGIN
  READ(Ch1, Ch2, Ch3);
  WRITELN('������� ������: ', Ch1, Ch2, Ch3);
  WRITE('C������������ ������: ');
  {��������� Ch1, Ch2, Ch3 � OUTPUT}
  IF Ch1 < Ch2
  THEN
    {Ch1 < Ch2:��������� Ch1, Ch2, Ch3 � OUTPUT}
    IF Ch2 < Ch3
    THEN {Ch1 < Ch2 < Ch3:��������� Ch1, Ch2, Ch3 � OUTPUT}
      WRITELN(Ch1, Ch2, Ch3)
    ELSE
      {Ch1 < Ch2, Ch3 <= Ch2:��������� Ch1, Ch2, Ch3 � OUTPUT}
  ELSE
    {Ch2 <= Ch1:��������� Ch1, Ch2, Ch3 � OUTPUT}
END. {IFsort3}
