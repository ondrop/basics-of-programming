PROGRAM Stat(INPUT, OUTPUT);
VAR
  FileForStat: TEXT;
  Ch: CHAR;
  Average, Num, NumMax, NumMin, Counter, Overflow, InvalidData: INTEGER;
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
      ELSE
        IF Ch <> ' '
        THEN
          N := -2       
    END
END; {ReadNumber}
PROCEDURE Copy(VAR InF, OutF: TEXT);
VAR
  Ch: CHAR;
BEGIN {Copy}
  WHILE NOT(EOLN(InF))
  DO
    BEGIN
      READ(InF, Ch);
      WRITE(OutF, Ch)
    END;
  WRITELN(OutF)
END; {Copy} 
PROCEDURE CheckSpace(VAR InF: TEXT; VAR N: INTEGER);
VAR
  Ch, W1, W2: CHAR;
BEGIN {DelSpace}
  RESET(InF);
  W1 := '0';
  W2 := '0';
  IF NOT(EOLN(InF))
  THEN
    BEGIN
      READ(InF, Ch);  
      IF Ch = ' '
      THEN
        N := -2
      ELSE
        RESET(InF);
      WHILE ((W1 <> ' ') OR (W2 <> ' ')) AND (NOT(EOLN(InF)))
      DO
        BEGIN         
          W1 := W2;
          READ(InF, W2)
        END;
      IF (W1 = ' ') AND (W2 = ' ')
      THEN
        N := -2
      ELSE      
        RESET(InF)          
    END;  
END; {DelSpace}
BEGIN {Stat}
  Num := 0;
  NumMax := -1;
  NumMin := -1;
  Counter := 0;
  Average := 0;
  Overflow := 0;
  InvalidData := 0;    
  REWRITE(FileForStat);
  Copy(INPUT, FileForStat);
  CheckSpace(FileForStat, Num);
  WHILE (NOT(EOLN(FileForStat))) AND (Overflow = 0) AND (InvalidData = 0) AND (Num <> -2)
  DO
    BEGIN
      ReadNumber(FileForStat, Num);
      IF (Num <> -1) AND (Num <> -2) AND ((32767 - Average) >= Num)
      THEN
        BEGIN
          Counter := Counter + 1;
          WRITELN(OUTPUT, 'TEST ', Counter);
          Average := Average + Num;
          IF (NumMax <= Num) OR (NumMax = -1)
          THEN
            NumMax := Num; 
          IF (NumMin >= Num) OR (NumMin = -1)
          THEN
            NumMin := Num
        END
      ELSE    
        IF (Num = -2) 
        THEN 
          InvalidData := 1
        ELSE 
         Overflow := 1
    END;     
  IF (Counter <> 0) AND (Overflow = 0) AND (InvalidData = 0)
  THEN
    BEGIN
      WRITELN(OUTPUT, 'Maximum number = ', NumMax);  
      WRITELN(OUTPUT, 'Minimum number = ', NumMin);
      WRITELN(OUTPUT, 'Average score = ', Average DIV Counter, '.', (Average MOD Counter) * 100 DIV Counter)
    END
  ELSE
    IF Overflow = 1
    THEN
      WRITELN(OUTPUT, 'Overflow')
    ELSE
      WRITELN(OUTPUT, 'Invalid data')      
END. {Stat}
