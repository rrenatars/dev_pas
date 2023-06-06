UNIT TreeIO;
INTERFACE
  TYPE 
    Tree = ^NodeType;     
    NodeType = RECORD
                 Key: STRING;
                 LLink, RLink: Tree;
                 Count: INTEGER
               END;
    
IMPLEMENTATION
    
BEGIN  {TreeIO}
END.  {TreeIO}
