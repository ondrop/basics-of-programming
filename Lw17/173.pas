PROGRAM Stat(INPUT, OUTPUT);
CONST
  NegOne = -1;
  NegTwo = -2;
VAR
  Overflow, InvalidData: BOOLEAN;
  Average, Num, NumMax, NumMin, Counter: INTEGER;
PROCEDURE ReadDigit(VAR InF: TEXT; VAR D: INTEGER);
VAR
  Ch: CHAR;
BEGIN {ReadDigit}
  D := NegOne;
  IF NOT(EOLN(InF))
  THEN
    BEGIN
      READ(InF, Ch);
      IF (Ch = '0') THEN D := 0 ELSE
      IF (Ch = '1') THEN D := 1 ELSE
      IF (Ch = '2') THEN D := 2 ELSE
      IF (Ch = '3') THEN D := 3 ELSE
      IF (Ch = '4') THEN D := 4 ELSE
      IF (Ch = '5') THEN D := 5 ELSE
      IF (Ch = '6') THEN D := 6 ELSE
      IF (Ch = '7') THEN D := 7 ELSE
      IF (Ch = '8') THEN D := 8 ELSE
      IF (Ch = '9') THEN D := 9 ELSE
      IF (Ch = ' ') THEN D := NegTwo
    END
END; {ReadDigit}
PROCEDURE ReadNumber(VAR InF: TEXT; VAR N: INTEGER);
VAR
  D: INTEGER;
BEGIN {ReadNumber}
  N := 0;
  D := 0;
  WHILE (NOT(EOLN(InF))) AND (D <> NegOne) AND (D <> NegTwo) AND (N <> NegOne)
  DO
    BEGIN
      ReadDigit(InF, D);
      IF (D <> NegOne) AND (D <> NegTwo)
      THEN
        IF ((N * 10) + D) <= MAXINT
        THEN
          N := N * 10 + D
        ELSE
          N := NegOne
      ELSE
        IF D <> NegTwo 
        THEN
          N := NegTwo   
    END
END; {ReadNumber}
BEGIN {Stat}
  Num := 0;
  NumMax := NegOne;
  NumMin := NegOne;
  Counter := 0;
  Average := 0;
  Overflow := FALSE;
  InvalidData := FALSE;    
  WHILE (NOT(EOLN(INPUT))) AND NOT(Overflow) AND NOT(InvalidData) AND (Num <> NegTwo)
  DO
    BEGIN
      ReadNumber(INPUT, Num);
      IF (Num <> NegOne) AND (Num <> NegTwo) AND ((MAXINT - Average) >= Num)
      THEN
        BEGIN
          Counter := Counter + 1;
          Average := Average + Num;
          IF (NumMax <= Num) OR (NumMax = NegOne)
          THEN
            NumMax := Num; 
          IF (NumMin >= Num) OR (NumMin = NegOne)
          THEN
            NumMin := Num
        END
      ELSE    
        IF (Num = NegTwo) 
        THEN 
          InvalidData := TRUE
        ELSE 
         Overflow := TRUE
    END;     
  IF (Counter <> 0) AND NOT(Overflow) AND NOT(InvalidData)
  THEN
    BEGIN
      WRITELN(OUTPUT, 'Maximum number = ', NumMax);  
      WRITELN(OUTPUT, 'Minimum number = ', NumMin);
      WRITELN(OUTPUT, 'Average score = ', Average DIV Counter, '.', (Average MOD Counter) * 100 DIV Counter)
    END
  ELSE
    IF Overflow
    THEN
      WRITELN(OUTPUT, 'Overflow')
    ELSE
      WRITELN(OUTPUT, 'Invalid data')      
END. {Stat}
