UNIT ReadKeysIO;
INTERFACE     
  CONST
    SmallLetters = ['a' .. 'z', 'а' .. 'я', 'ё'];
    BigLetters = ['A' .. 'Z', 'А' .. 'Я', 'Ё'];
    AllLetters = (SmallLetters + BigLetters);
  VAR
    Word: STRING;
    Index: INTEGER;
  PROCEDURE ReadingKey(VAR FIn: TEXT; VAR Word: STRING); {Читает слово}
  FUNCTION CharToLower(VAR Ch: CHAR): CHAR;  {Переводит слово в нижний регистр}
  FUNCTION DeleteDashesAfterWord(VAR Word: STRING; Index: INTEGER): STRING;  {Удаляет дефисы в конце слова}
  
IMPLEMENTATION

  PROCEDURE ReadingKey(VAR FIn: TEXT; VAR Word: STRING);
  VAR
    LowerChar, Ch: CHAR;
  BEGIN  {ReadingWords}     
    Word := '';
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
  END;  {ReadingWords}
  
  FUNCTION CharToLower(VAR Ch: CHAR): CHAR;
  BEGIN  {CharToLower}
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
{    UpperCase := 'ABCDEFGHIJKLMNOPQАБВГДЕЁ-';
    LowerCase := 'abcdefghijklmnopqабвгдеё-';
    IF (POS(UpperCase, Ch) > 0)
    THEN
      Result := LowerCase[POS(UpperCase, Ch)]
    ELSE
      Result := Ch }
  END;  {CharToLower}
  
  FUNCTION DeleteDashesAfterWord(VAR Word: STRING; Index: INTEGER): STRING; 
  VAR
    WordWithoutDash: STRING;
    Len: INTEGER;
  BEGIN  {DeleteDashesAfterWords}
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
  END;  {DeleteDashesAfterWords}

BEGIN  {ReadWordsIO}
  Word := '';
  Index := 0
END.  {ReadWordsIO}
  
  
   
  
