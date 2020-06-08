PROGRAM Encryption(INPUT, OUTPUT);
{Переводит символы из INPUT в код согласно Chiper 
  и печатает новые символы в OUTPUT}
CONST
  Len = 20;
TYPE
  Str = ARRAY [1 .. Len] OF CHAR;
  Chiper = ARRAY [' ' .. 'Z'] OF CHAR;
  SieveSymbols = SET OF CHAR;
VAR
  Msg: Str;
  Code: Chiper;
  I: INTEGER;
  StrLength: 1 .. Len;  
  CipherFile: TEXT; 
  SieveCode: SieveSymbols;   
 
PROCEDURE Initialize(VAR FIn: TEXT; VAR Code: Chiper; VAR SieveCode: SieveSymbols);
{Присвоить Code шифр замены}
VAR
  Ch1, Ch2: CHAR;             
  Sieve: SET OF CHAR;
BEGIN {Initialize}    
  Sieve := ['A' .. 'Z', ' '];
  SieveCode := [];  
  RESET(FIn);
  WHILE NOT EOF(FIn)
  DO
    BEGIN
      Ch1 := ' ';
      Ch2 := '#';
      WHILE NOT EOLN(FIn) AND (Ch1 = ' ')
      DO
        READ(FIn, Ch1);   
      IF NOT EOLN(FIn) AND (Ch2 = '#')
      THEN
        BEGIN
          READ(FIn, Ch2);
          IF NOT EOLN(FIn)
          THEN
            READ(FIn, Ch2)
        END;    
      IF (Ch2 <> '#')
      THEN
        BEGIN
          Code[Ch2] := Ch1;     
          SieveCode := SieveCode + [Ch2]
        END;
      READLN(FIn);  
    END
END;  {Initialize}
 
PROCEDURE Decode(VAR S: Str; VAR SieveCode: SieveSymbols);
{Выводит символы из Code, соответствующие символам из S}
VAR
  Index: 1 .. Len;           
BEGIN {Encode}           
  FOR Index := 1 TO StrLength
  DO
    IF S[Index] IN SieveCode
    THEN
      WRITE(Code[S[Index]])
    ELSE
      WRITE(S[Index]);
  WRITELN
END;  {Encode}
 
BEGIN {Encryption}
  {Инициализировать Code}
  ASSIGN(CipherFile, 'cipher.txt');
  Initialize(CipherFile, Code, SieveCode);
  WHILE NOT EOF(INPUT)
  DO
    BEGIN
      {читать строку в Msg и распечатать ее}
      I := 0;  
      WHILE NOT EOLN(INPUT) AND (I < Len)
      DO
        BEGIN
          I := I + 1; 
          StrLength := I;
          READ(INPUT, Msg[I]);
          WRITE(OUTPUT, Msg[I])
        END;  
      READLN(INPUT);
      WRITELN(OUTPUT);         
      {распечатать кодированное сообщение}
      Decode(Msg, SieveCode)
    END
END.  {Encryption}
