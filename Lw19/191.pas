PROGRAM Prime(INPUT, OUTPUT);
CONST
  Min = 2;
  Max = 100;
VAR
  Sieve: SET OF Min .. Max;
  NextNumber, TotalNumber: INTEGER;
BEGIN {Prime}    
  Sieve := [Min .. Max];   
  NextNumber := Min;
  TotalNumber := Min;
  WRITE('Простые числа в диапазоне до ', Max, ' будут ');
  WHILE NextNumber <= Max
  DO
    BEGIN                       
      WHILE TotalNumber <= Max 
      DO
        BEGIN
          Sieve := Sieve - [TotalNumber];
          TotalNumber := TotalNumber + NextNumber               
        END;    
      WRITE(NextNumber, ' ');    
      WHILE NOT(NextNumber IN Sieve) AND (NextNumber <= Max)  
      DO
        NextNumber := NextNumber + 1;
      TotalNumber := NextNumber
    END;         
  WRITELN     
END. {Prime}                        
