PROGRAM Decryption(INPUT, OUTPUT);
{Переводит символы из INPUT в код согласно Chiper 
  и печатает новые символы в OUTPUT}
CONST
  Len = 20;
TYPE
  Str = ARRAY [1 .. Len] OF 'A' .. 'Z';
  Chiper = ARRAY ['A' .. 'Z'] OF CHAR;
  SieveLetter = SET OF 'A' .. 'Z';
VAR
  Msg: Str;
  Code: Chiper;
  I: INTEGER;
  StrLength: 1 .. Len;  
  CipherFile: TEXT; 
  SieveCode: SieveLetter;
 
PROCEDURE Initialize(VAR FIn: TEXT; VAR Code: Chiper; VAR SieveCode: SieveLetter);
{Присвоить Code шифр замены}
VAR
  Ch1, Ch2: CHAR;
BEGIN {Initialize}
  SieveCode := [];  
  RESET(FIn);
  WHILE NOT EOF(FIn)
  DO
    BEGIN
      Ch1 := ' ';
      Ch2 := ' ';
      WHILE NOT EOLN(FIn) AND (Ch1 = ' ')
      DO
        READ(FIn, Ch1);
      READ(FIn, Ch2);   
      WHILE NOT EOLN(FIn) AND (Ch2 = ' ')
      DO
        READ(FIn, Ch2);    
      IF (Ch1 IN ['A' .. 'Z']) AND (Ch2 <> ' ')
      THEN
        BEGIN
          Code[Ch2] := Ch1;     
          SieveCode := SieveCode + [Ch2]
        END;
      READLN(FIn);  
    END
END;  {Initialize}
 
PROCEDURE Encode(VAR S: Str; VAR SieveCode: SieveLetter);
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
      IF S[Index] = ' '
      THEN
        WRITE('%/')
      ELSE
        WRITE(S[Index]);
  WRITELN
END;  {Encode}
 
BEGIN {Decryption}
  {Инициализировать Code}
  ASSIGN(CipherFile, 'cipher.TXT');
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
      Encode(Msg, SieveCode)
    END
END.  {Decryption}
