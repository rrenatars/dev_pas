UNIT Count3;
INTERFACE
PROCEDURE Start; {Обнуляем счетчик}
PROCEDURE Bump; {Инкремент счетчика}
PROCEDURE Value(VAR Ones, Tens, Hundreds: CHAR);
IMPLEMENTATION
VAR
  Ones, Tens, Hundreds: CHAR;
PROCEDURE Start;
  {Ones, Tens, Hundreds := 0, 0, 0}
BEGIN {Start}
  Ones := '0';
  Tens := '0';
  Hundreds := '0';
  WRITELN(Ones, Tens, Hundreds)
END; {Start}

PROCEDURE Bump;
  {Увеличивает 3-цифровой счетчик определенный Ones, Tens, Hundreds
  на единицу, если он находится в диапaзоне от 0 до 999 }
  VAR
    Overflow: CHAR; { Y/N }
  PROCEDURE NextDigit(VAR Digit, Overflow: CHAR);
  BEGIN {NextDigit}
    Overflow := 'N';
    IF Digit = '0' THEN Digit := '1' ELSE
    IF Digit = '1' THEN Digit := '2' ELSE
    IF Digit = '2' THEN Digit := '3' ELSE
    IF Digit = '3' THEN Digit := '4' ELSE
    IF Digit = '4' THEN Digit := '5' ELSE
    IF Digit = '5' THEN Digit := '6' ELSE
    IF Digit = '6' THEN Digit := '7' ELSE
    IF Digit = '7' THEN Digit := '8' ELSE
    IF Digit = '8' THEN Digit := '9' ELSE
    IF Digit = '9' THEN Digit := '0'
  END;{NextDigit}
BEGIN {Bump}
  NextDigit(Ones, Overflow);
  IF Overflow = 'Y'
  THEN
    BEGIN
      NextDigit(Tens, Overflow);
      IF Overflow = 'Y'
      THEN
        BEGIN
          NextDigit(Hundreds, Overflow);
          IF Overflow = 'Y'
          THEN
            BEGIN
              Ones := '9';
              Tens := '9';
              Hundreds := '9'
            END
        END
    END
END; {Bump}
    
PROCEDURE Value(VAR V1, V10, V100: CHAR);
{Возвращет содержимое счетчика}
BEGIN
  V100 := Hundreds;
  V10 := Tens;
  V1 := Ones
END;
    
BEGIN
END. {UNIT Count3}

