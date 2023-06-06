UNIT SortIO;
INTERFACE
  USES
    TreeIO;
  VAR
    Root: Tree;  
  PROCEDURE Sort(Data: STRING);  {��������� �����} 
  PROCEDURE OutputKeys(VAR FOut: TEXT); {������� ����� � ��������������� �������}
  
IMPLEMENTATION

  PROCEDURE Sort(Data: STRING); 
  PROCEDURE Insert(VAR Ptr: Tree; Data: STRING); 
  BEGIN {SortWords}
    IF Ptr = NIL
    THEN
      BEGIN {������� ���� �� ��������� Data}
        NEW(Ptr);
        Ptr^.Key := Data;
        Ptr^.Count := 1;
        Ptr^.LLink := NIL;
        Ptr^.RLink := NIL 
      END
    ELSE
      BEGIN
        IF Ptr^.Key > Data 
        THEN
          Insert(Ptr^.LLink, Data)
        ELSE
          BEGIN
            IF Ptr^.Key < Data
            THEN                  
              Insert(Ptr^.RLink, Data)
            ELSE 
              Ptr^.Count := Ptr^.Count + 1
          END
      END
  END;  {SortWords}
  BEGIN
    Insert(Root, Data)
  END;
  
  PROCEDURE OutputKeys(VAR FOut: TEXT);
  PROCEDURE OutputTree(VAR FOut: TEXT; Ptr: Tree);
  BEGIN {PrintTree}
    IF Ptr <> NIL
    THEN  {�������� ��������� �����, �������, ��������� ������}
      BEGIN                       
        OutputTree(FOut, Ptr^.LLink);
        WRITELN(FOut, Ptr^.Key, ' ', Ptr^.Count);
        OutputTree(FOut, Ptr^.RLink)
      END
  END;  {PrintTree}
  BEGIN
    OutputTree(FOut, Root)
  END;

BEGIN  {Sort}
  Root := NIL
END.  {Sort}
  
  
   
  
