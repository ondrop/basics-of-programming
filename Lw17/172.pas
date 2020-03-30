PROGRAM TestReadNumber(INPUT, OUTPUT);
VAR
  Number: INTEGER;
PROCEDURE ReadNumber(VAR InF: TEXT; VAR N: INTEGER); 
VAR
  Ch: CHAR;
  D, Error: INTEGER; 
BEGIN {ReadNumber}
  Ch := '0';
  N := 0; 
  WHILE (NOT(EOLN(InF))) AND ((Ch >= '0') AND (Ch <= '9')) AND (N <> -1)
  DO
    BEGIN
      READ(InF, Ch);
      IF (Ch >= '0') AND (Ch <= '9')
      THEN
        BEGIN
          Val(Ch, D, Error);
          IF (N < 3276)
          THEN
            N := (N * 10) + D
          ELSE
            IF (Ch <= '7') AND (N = 3276)
            THEN
              N := (N * 10) + D
            ELSE
              N := -1    
        END
    END
END; {ReadNumber} 
BEGIN {TestReadNumber}
  ReadNumber(INPUT, Number);
  WRITELN(OUTPUT, Number)
END. {TestReadNumber}
