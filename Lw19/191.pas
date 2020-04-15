PROGRAM Prime(INPUT, OUTPUT);
CONST
  Min = 2;
  Max = 100;
VAR
  Sieve: SET OF Min .. Max;
  NextNumber, TotalNumber, Number: INTEGER;
  PrimeFile: TEXT;
  Ch: CHAR;
BEGIN {Prime}    
  Number := Min;      
  Sieve := [Min .. Max];
  REWRITE(PrimeFile);   
  NextNumber := Min;
  TotalNumber := Min;
  WHILE (Number <= Max)
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
          Number := Number + 1
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
