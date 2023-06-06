UNIT ReadKeysIO2;
INTERFACE                                    
  PROCEDURE ReadingKey(VAR FIn: TEXT; VAR Word: STRING); {Читает слово}
  FUNCTION Lexico(VAR Word1, Word2: STRING): INTEGER; {Сравнивает два слова}
  
IMPLEMENTATION
  CONST
    SmallLetters = ['a' .. 'z', 'а' .. 'я', 'ё'];
    BigLetters = ['A' .. 'Z', 'А' .. 'Я', 'Ё'];
    AllLetters = (SmallLetters + BigLetters);   

  PROCEDURE ReadingKey(VAR FIn: TEXT; VAR Word: STRING);
  VAR
    LowerChar, Ch: CHAR; 
    Index: INTEGER;
  FUNCTION CharToLower(VAR Ch: CHAR): CHAR;
  BEGIN {CharToLower}
    CASE Ch OF
      'A': Result := 'a';
      'B': Result := 'b';
      'C': Result := 'c';
      'D': Result := 'd';
      'E': Result := 'e';
      'F': Result := 'f';
      'G': Result := 'g';
      'H': Result := 'h';
      'I': Result := 'i';
      'J': Result := 'j';
      'K': Result := 'k';
      'L': Result := 'l';
      'M': Result := 'm';
      'N': Result := 'n';
      'O': Result := 'o';
      'P': Result := 'p';
      'Q': Result := 'q';
      'R': Result := 'r';
      'S': Result := 's';
      'T': Result := 't';
      'U': Result := 'u';
      'V': Result := 'v';
      'W': Result := 'w';
      'X': Result := 'x';
      'Y': Result := 'y';
      'Z': Result := 'z';
      'А': Result := 'а';
      'Б': Result := 'б';
      'В': Result := 'в';
      'Г': Result := 'г';
      'Д': Result := 'д';
      'Е': Result := 'е';
      'Ё': Result := 'ё';
      'Ж': Result := 'ж';
      'З': Result := 'з';
      'И': Result := 'и';
      'Й': Result := 'й';
      'К': Result := 'к';
      'Л': Result := 'л';
      'М': Result := 'м';
      'Н': Result := 'н';
      'О': Result := 'о';
      'П': Result := 'п';
      'Р': Result := 'р';
      'С': Result := 'с';
      'Т': Result := 'т';
      'У': Result := 'у';
      'Ф': Result := 'ф';
      'Х': Result := 'х';
      'Ц': Result := 'ц';
      'Ч': Result := 'ч';
      'Ш': Result := 'ш';
      'Щ': Result := 'щ';
      'Ъ': Result := 'ъ';
      'Ы': Result := 'ы';
      'Ь': Result := 'ь';
      'Э': Result := 'э';
      'Ю': Result := 'ю';
      'Я': Result := 'я'
    ELSE
      Result := Ch
    END
  END; {CharToLower}      
  
  FUNCTION DeleteDashesAfterWord(VAR Word: STRING; Index: INTEGER): STRING; 
  VAR
    WordWithoutDash: STRING;
    Len: INTEGER;
  BEGIN  {DeleteDashesAfterWord}
    WordWithoutDash := '';
    WHILE NOT(Word[Index] IN AllLetters)
    DO 
      Index := Index -1;
    Len := Index;
    Index := 1;
    WHILE Index <= Len
    DO
      BEGIN
        WordWithoutDash := WordWithoutDash + Word[Index];
        Index := Index + 1
      END;
    Result := WordWithoutDash    
  END;  {DeleteDashesAfterWord}
  
  BEGIN  {ReadingKey}     
    Word := ''; 
    Index := 0;
    REPEAT               
      READ(FIn, Ch);                     
      IF Ch IN (AllLetters + ['-'])
      THEN
        BEGIN       
          IF Ch IN AllLetters
          THEN
            BEGIN
              LowerChar := CharToLower(Ch);
              Word := Word + LowerChar;
              Index := Index + 1
            END
          ELSE
            BEGIN
              IF Word <> ''
              THEN
                BEGIN
                  Word := Word + Ch;
                  Index := Index + 1
                END
            END
        END;    
    UNTIL NOT(Ch IN (AllLetters + ['-']));
    IF Word[Index] = '-'
    THEN  
      Word := DeleteDashesAfterWord(Word, Index)
  END;  {ReadingKey}
  
  FUNCTION Lexico(VAR Word1, Word2: STRING): INTEGER;
  BEGIN {Lexico}
    IF Word1 < Word2
    THEN
      Result := 1
    ELSE
      IF Word1 > Word2 
      THEN
        Result := 2
      ELSE
        Result := 0               
  END; {Lexico}
  
BEGIN  {ReadKeysIO2}
END.  {ReadKeysIO2}
  
  
   
  
