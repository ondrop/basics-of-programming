PROGRAM TestReadNumber(INPUT, OUTPUT);
VAR
  Number: INTEGER;
PROCEDURE ReadNumber(VAR InF: TEXT; VAR N: INTEGER); 
VAR
  Ch: CHAR;
  D: INTEGER; 
BEGIN {ReadNumber}
  Ch := '0';
  N := 0; 
  WHILE (NOT(EOLN(InF))) AND ((Ch >= '0') AND (Ch <= '9')) AND (N <> -1)
  DO
    BEGIN 
      D := -1;
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
      IF (Ch = '9') THEN D := 9; 
      IF (D <> -1)
      THEN
        BEGIN
          N := N * 10;
          IF (D <= (32767 - N))
          THEN
            N := N + D
          ELSE
            N := -1    
        END     
    END
END; {ReadNumber} 
BEGIN {TestReadNumber}
  ReadNumber(INPUT, Number);
  WRITELN(OUTPUT, Number)
END. {TestReadNumber}
