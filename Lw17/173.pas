PROGRAM Stat(INPUT, OUTPUT);
VAR
  Average, Num, NumMax, NumMin, Counter, State: INTEGER;
PROCEDURE ReadNumber(VAR InF: TEXT; VAR N, State: INTEGER);
VAR
  Ch: CHAR;
  D, Error: INTEGER; 
BEGIN {ReadNumber}
  Ch := '0';
  N := 0;
  State := 0; 
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
            BEGIN
              N := (N * 10) + D;
              State := 1
            END
          ELSE
            IF (Ch <= '7') AND (N = 3276)                                                           
            THEN
              BEGIN
                N := (N * 10) + D;
                State := 1
              END
            ELSE
              BEGIN
                N := -1;
                Ch := '0';
                WHILE (NOT(EOLN(InF)) AND (Ch = '0'))
                DO
                  READ(InF, Ch)
              END    
        END
    END  
END; {ReadNumber} 
BEGIN {Stat} 
  Num := -1;
  NumMax := 0;
  NumMin := 0;
  Counter := 0;
  Average := 0;
  WHILE ((Num = -1) OR (State = 0)) AND (NOT(EOLN(INPUT)))
  DO
    BEGIN
      ReadNumber(INPUT, Num, State);
      IF ((Num <> -1) AND (State <> 0)) 
      THEN
        BEGIN
          NumMax := Num;
          NumMin := Num;          
          Counter := Counter + 1; 
          WRITELN(OUTPUT, Counter);
          Average := Average + Num
        END                                 
    END; 
  WHILE NOT(EOLN(INPUT))
  DO
    BEGIN
      ReadNumber(INPUT, Num, State);
      IF ((Num <> -1) AND (State <> 0)) AND ((32767 - Average) > Num)
      THEN
        BEGIN
          Average := Average + Num;                                    
          Counter := Counter + 1;  
          IF (NumMax <= Num)
          THEN
            NumMax := Num
          ELSE  
           IF (NumMin >= Num)
           THEN
             NumMin := Num
        END    
    END;
  WRITELN(OUTPUT, 'Maximum number = ', NumMax);  
  WRITELN(OUTPUT, 'Minimum number = ', NumMin);
  WRITE(OUTPUT, 'Average score = ');
  IF (Counter <> 0)
  THEN  
    WRITELN(OUTPUT, Average DIV Counter, '.', (Average MOD Counter) * 100 DIV Counter)
  ELSE
    WRITELN(OUTPUT, Average)  
END. {Stat}
