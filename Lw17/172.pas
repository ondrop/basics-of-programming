PROGRAM TestReadNumber(INPUT, OUTPUT);
VAR
  Number: INTEGER;
PROCEDURE ReadDigit(VAR InF: TEXT; VAR D: INTEGER);
VAR
  Ch: CHAR;
BEGIN {ReadDigit}
  D := -1;
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
      IF (Ch = '9') THEN D := 9
    END
END; {ReadDigit}
PROCEDURE ReadNumber(VAR InF: TEXT; VAR N: INTEGER);
VAR
  Ch: CHAR;
  D: INTEGER;
BEGIN {ReadNumber}
  N := 0;
  D := 0;
  WHILE (NOT(EOLN(InF))) AND (D <> -1) AND (N <> -1)
  DO
    BEGIN
      ReadDigit(InF, D);
      IF (D <> -1)
      THEN
        IF (N <= 3276) AND (D <= 7)
        THEN
          N := N * 10 + D
        ELSE
          N := -1
    END
END; {ReadNumber}
BEGIN {TestReadNumber}
  ReadNumber(INPUT, Number);
  WRITELN(OUTPUT, Number)
END. {TestReadNumber}
