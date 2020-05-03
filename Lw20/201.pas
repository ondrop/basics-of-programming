PROGRAM XPrint(INPUT, OUTPUT);
CONST
  Min = 1;
  Last = 5;
  Max = 25;
TYPE 
  Sieve = SET OF Min .. Max;
VAR
  SymbolCode: Sieve;
  
PROCEDURE EncodingSymbol(VAR FIn: TEXT; VAR ManyNumbers: Sieve);
VAR  
  Ch: CHAR;
BEGIN {EncodingSymbol}
  READ(FIn, Ch);
  ManyNumbers := [];
  IF Ch = 'A'
  THEN
    ManyNumbers := [2, 3, 4, 6, 10, 11, 13, 15, 16, 20, 21, 25];
  IF Ch = 'B'
  THEN
    ManyNumbers := [1 .. 4, 6, 10, 11 .. 14, 16, 20, 21 .. 24];
  IF Ch = 'C'
  THEN
    ManyNumbers := [2 .. 6, 11, 16, 22 .. 25];    
  IF Ch = 'D'
  THEN
    ManyNumbers := [1 .. 4, 6, 10, 11, 15, 16, 20 .. 24];
  IF Ch = 'E'
  THEN
    ManyNumbers := [1 .. 6, 11 .. 16, 21 .. 25]  
END; {EncodingSymbol} 

PROCEDURE PrintSymbol(VAR FOut: TEXT; VAR ManyNumbers: Sieve);
VAR
  WhichNumber, I: INTEGER;
BEGIN {PrintSymbol}
  WhichNumber := Min;
  WHILE (WhichNumber <= Max) AND (ManyNumbers <> [])
  DO
    BEGIN
      FOR I := Min TO Last
      DO
        BEGIN
          IF WhichNumber IN ManyNumbers
          THEN
            WRITE(FOut, 'X')
          ELSE
            WRITE(FOut, ' ');
          WhichNumber := WhichNumber + 1
        END;
      WRITELN(FOut)      
    END 
END; {PrintSymbol}

BEGIN {XPrint}
  IF NOT EOLN
  THEN
    BEGIN
      EncodingSymbol(INPUT, SymbolCode);  
      PrintSymbol(OUTPUT, SymbolCode)
    END
END. {XPrint}
