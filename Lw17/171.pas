PROGRAM TestReadDigit(INPUT, OUTPUT);
VAR
  Digit, Sum: INTEGER;
PROCEDURE ReadDigit(VAR InF: TEXT; VAR D: INTEGER);
{���뢠�� ⥪�騩 ᨬ��� �� 䠩��, �᫨ �� - ���, �����頥� ��� 
 �८�ࠧ�� � ���祭�� ⨯� INTEGER. �᫨ ��⠭�� ᨬ��� �� ���
 �����頥� -1}
VAR
  Ch: CHAR;
  Error: INTEGER; 
BEGIN {ReadDigit}
  IF NOT(EOLN(InF))
  THEN
    BEGIN
      READ(InF, Ch);
      IF (Ch >= '0') AND (Ch <= '9')
      THEN
        {��楤�� Val, �८�ࠧ��뢠�� ��ப���� ���祭�� 
         � ��� �᫮��� �।�⠢�����}
        Val(Ch, D, Error)
      ELSE
        D := -1 
    END 
END; {ReadDigit} 
BEGIN {TestReadDigit}
  Digit := 0;
  Sum := 0;
  WHILE NOT(EOLN(INPUT)) AND (Digit <> -1) 
  DO
    BEGIN
      ReadDigit(INPUT, Digit);
      IF Digit <> -1
      THEN
        Sum := Sum + Digit
    END;
  WRITELN(OUTPUT, Sum)
END. {TestReadDigit}
