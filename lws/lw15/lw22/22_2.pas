PROGRAM InsertionSort(INPUT, OUTPUT);
{��������� ������� �� INPUT}
CONST
  Max = 16;
  ListEnd = 0;
TYPE
  RecArray = ARRAY [1 .. Max] OF 
               RECORD
                 Key: CHAR;
                 Next: 0 .. Max;
               END;
VAR
  Arr: RecArray;
  First, Index: 0 .. Max;
  Prev, Curr: 0 .. Max;  
  Extra: CHAR;
  Found: BOOLEAN;
BEGIN {InsertionSort}
  First := 0;
  Index := 0;
  WHILE NOT EOLN      
  DO
    BEGIN
      {�������� ������ � ������, ���� ��������� ������������, 
      ����� ������������ � �������� �� ������}
      Index := Index + 1;
      IF Index > Max
      THEN
        BEGIN
          READ(Extra);
          WRITELN('��������� ��������: ', Extra, '. ����������.');
        END
      ELSE
        BEGIN
          READ(Arr[Index].Key); 
          {��������� Arr[Index] � ��������� ������}
          Prev := 0;
          Curr := First;  
          {����� �������� Prev � Curr, ���� ���������� ����� ���
          Arr[Prev].Key  <= Arr[Index].Key <= Arr[Curr].Key}
          Found := FALSE;
          WHILE (Curr <> 0) AND NOT Found
          DO
            BEGIN
            IF Arr[Index].Key = 'Y'
            THEN
              WRITELN('yyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
            IF Arr[Index].Key > Arr[Curr].Key
            THEN
              BEGIN
                WRITELN(Index, Arr[Index].Key, '  ', Curr, Arr[Curr].Key);
                Prev := Curr;             
                Curr := Arr[Curr].Next 
              END
            ELSE
              BEGIN
                Found := True;
                WRITELN(Arr[Index].Key)
              END
            END;
          Arr[Index].Next := Curr;
          WRITELN(Arr[Index].Key, '++++', Arr[Index].Next);
          IF Prev = 0  {������ ������� � ������}
          THEN
            BEGIN
              First := Index;
              WRITELN(Arr[Index].Key, 'First', First)
            END
          ELSE
            BEGIN
              Arr[Prev].Next := Index
            END;
          IF Arr[1].Next = 2
          THEN
            BEGIN
              WRITELN(Index)
            END; 
          WRITELN(Arr[Index].Key, 'Next', Arr[Curr].Next);
          WRITELN('Prev', Arr[Index].Key, Prev);
          WRITELN(Arr[Index].Key, 'Curr', Arr[Index].Next, '---')
        END
    END; {WHILE}
  {������ ������ ������� � Arr[First]}
  Index := First;      
  WHILE Index <> ListEnd
  DO
    BEGIN
      WRITE(Arr[Index].Key);  
      Index := Arr[Index].Next
    END;
  WRITELN;
END.  {InsertionSort}

