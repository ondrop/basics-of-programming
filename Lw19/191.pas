PROGRAM Prime(INPUT, OUTPUT);
VAR
  Sieve: SET OF 0 .. MAXINT;
  NextNumber, TotalNumber, Number, Min, Max: INTEGER;
  PrimeFile: TEXT;
  Ch: CHAR;
BEGIN {Prime}
  Number := 0;
  WRITELN(OUTPUT, 'Введите минимальное число.');
  IF NOT(EOLN(INPUT))
  THEN
    READ(INPUT, Number);
  Min := Number;  
  READLN(INPUT);  
  WRITELN(OUTPUT, 'Введите максимальное число.');
  IF NOT(EOLN(INPUT))
  THEN
    READ(INPUT, Number);
  Max := Number;   
  Sieve := [Min .. Max];
  REWRITE(PrimeFile);   
  NextNumber := Min;
  TotalNumber := Min;
  WHILE (Min <= Max)
  DO
    BEGIN                       
      WHILE (TotalNumber <= Max) 
      DO
        BEGIN    
          IF (TotalNumber MOD NextNumber) = 0
          THEN
            BEGIN
              Sieve := Sieve - [TotalNumber]
            END;
          TotalNumber := TotalNumber + 1                
        END;    
      WRITELN(PrimeFile, NextNumber);    
      WHILE (NOT(NextNumber IN Sieve)) AND (NextNumber <= Max)  
      DO
        BEGIN
          NextNumber := NextNumber + 1;              
          Min := Min + 1
        END;                    
      TotalNumber := NextNumber
    END;         
  RESET(PrimeFile);
  WRITE(OUTPUT, 'Простые числа в диапазоне до ', Max, ' будут ');
  WHILE NOT(EOF(PrimeFile))
  DO
    BEGIN
      WHILE NOT(EOLN(PrimeFile))
      DO
        BEGIN
          READ(PrimeFile, Ch);
          WRITE(OUTPUT, Ch)
        END;
      WRITE(OUTPUT, ' ');  
      READLN(PrimeFile)  
    END;
  WRITELN(OUTPUT)     
END. {Prime}                        
