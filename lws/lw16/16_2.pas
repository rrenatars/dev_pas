PROGRAM SarahRevere(INPUT, OUTPUT);
VAR
  W1, W2, W3, W4: CHAR;
  Looking, Land, Sea: BOOLEAN; 
  
PROCEDURE Start(VAR W1, W2, W3, W4: CHAR; VAR Looking, Land, Sea: BOOLEAN); 
BEGIN {Start} 
  W1 := ' ';
  W2 := ' ';
  W3 := ' ';
  W4 := ' ';
  Looking := TRUE;
  Land := FALSE;
  Sea := FALSE
END; {Start}
  
PROCEDURE Window(VAR W1, W2, W3, W4: CHAR; VAR Looking: BOOLEAN); 
BEGIN {Window} 
  W1 := W2;
  W2 := W3;
  W3 := W4;
  READ(W4);
  IF W4 = '#'
  THEN
    Looking := FALSE
END; {Window}

PROCEDURE CheckLand(VAR W1, W2, W3, W4: CHAR; VAR Land: BOOLEAN); 
BEGIN {CheckLand} 
  Land := (W1 = 'l') AND (W2 = 'a') AND (W3 = 'n') AND (W4 = 'd')
END; {CheckLand}

PROCEDURE CheckSea(VAR W1, W2, W3, W4: CHAR; VAR Sea: BOOLEAN); 
BEGIN {CheckSea} 
  Sea := (W1 = 's') AND (W2 = 'e') AND (W3 = 'a')
END; {CheckSea}

PROCEDURE PrintMessage(VAR Sea, Land: BOOLEAN); 
BEGIN {PrintMessage}
  IF Land
  THEN
    WRITELN('British are coming by land.')
  ELSE
    IF Sea
    THEN
      WRITELN('British are coming by sea.')
    ELSE
      WRITELN('Sarah didn''t say.')  
END; {PringMessage}

BEGIN {SarahRevere}   
  {Инициализация}
  Start(W1, W2, W3, W4, Looking, Land, Sea);
  WHILE Looking AND NOT (Land OR Sea)
  DO
    BEGIN
      {движение окна}
      Window(W1, W2, W3, W4, Looking);
      {проверка окна на land}
      CheckLand(W1, W2, W3, W4, Land);
      {проверка окна на sea}
      CheckSea(W1, W2, W3, W4, Sea)
    END;
  {создание сообщения Sarah}
  PrintMessage(Sea, Land)
END. {SarahRevere} 
 
