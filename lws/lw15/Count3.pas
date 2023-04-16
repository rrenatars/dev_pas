UNIT Count3;
INTERFACE

PROCEDURE Start; {Обнуление счетчика}
PROCEDURE Bump; {Инкремент счетчика}
PROCEDURE Value(VAR V100, V10, V1: CHAR); {Выводим значение счетчика}

IMPLEMENTATION
VAR
  Ones, Tens, Hundreads: CHAR;
  
PROCEDURE Start;
{Ones, Tens, Hundreads := 0, 0, 0}
BEGIN {Start}
  Ones := '0';
  Tens := '0';
  Hundreads := '0';
END; {Start}

PROCEDURE Bump; {Bump}
{Увеличивает 3-символьный счетчик с контролем переполнения}
VAR
  Overflow: CHAR; {Y/N}
PROCEDURE NextDigit(VAR Digit, Overflow: CHAR);
BEGIN {NextDigit}
  Overflow := 'N';
  IF Digit = '0' 
  THEN 
    Digit := '1' 
  ELSE
    IF Digit = '1' 
    THEN 
      Digit := '2' 
    ELSE
      IF Digit = '2' 
      THEN 
        Digit := '3' 
      ELSE
        IF Digit = '3' 
        THEN 
          Digit := '4' 
        ELSE
          IF Digit = '4' 
          THEN 
            Digit := '5' 
          ELSE
            IF Digit = '5' 
            THEN 
              Digit := '6' 
            ELSE
              IF Digit = '6' 
              THEN 
                Digit := '7' 
              ELSE
                IF Digit = '7' 
                THEN 
                  Digit := '8' 
                ELSE
                  IF Digit = '8' 
                  THEN 
                    Digit := '9' 
                  ELSE
                    IF Digit = '9' 
                    THEN 
                      BEGIN
                        Digit := '0';
                        Overflow := 'Y'
                      END
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
          NextDigit(Hundreads, Overflow);
          IF Overflow = 'Y'
          THEN
            BEGIN
              Ones := '9';
              Tens := '9';
              Hundreads := '9'
            END
        END
    END
END; {Bump}

PROCEDURE Value(VAR V100, V10, V1: CHAR);
{Возвращет содержимое счетчика}
BEGIN {Value}
  V100 := Hundreads;
  V10 := Tens;
  V1 := Ones
END; {Value}

BEGIN
END. {UNIT Count3}
