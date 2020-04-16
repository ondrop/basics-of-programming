PROGRAM AverageScore(INPUT, OUTPUT);
CONST
  NumberOfScores = 4;                               
  ClassSize = 4; 
  MinNumber = 0;
  MaxNumber = 100;
TYPE
  Score = MinNumber .. MaxNumber;
VAR
  WhichScore: MinNumber .. NumberOfScores;
  Student: MinNumber .. ClassSize;
  NextScore: Score;
  Ave, TotalScore, ClassTotal: INTEGER;
  IsCorrectData, IsOverFlow: BOOLEAN;
  LastName: TEXT;
  Ch: CHAR;
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
BEGIN {AverageScore}
  ClassTotal := MinNumber;
  WRITELN(OUTPUT, 'Student averages:');
  Student := MinNumber;
  IsCorrectData := TRUE;
  IsOverFlow := FALSE;              
  WHILE (Student < ClassSize) AND (IsCorrectData) AND (NOT(IsOverFlow))
  DO                                                                         
    BEGIN                    
      Student := Student + 1;
      TotalScore := MinNumber;
      WhichScore := MinNumber;
      Ch := ' ';
      IsCorrectData := TRUE;
      WRITELN(OUTPUT, 'Enter last name of ', Student, ' student.');
      WHILE (NOT(EOLN(INPUT))) AND (Ch = ' ')
      DO
        READ(INPUT, Ch);
      REWRITE(LastName);  
      IF (Ch <> ' ') AND (Ch >= 'A') AND (Ch <= 'Z')
      THEN
        BEGIN
          WRITE(LastName, Ch);
          Ch := 'a';
          WHILE (NOT(EOLN(INPUT))) AND (Ch >= 'a') AND (Ch <= 'z')
          DO
            BEGIN
              READ(INPUT, Ch);
              IF (Ch >= 'a') AND (Ch <= 'z')
              THEN
                WRITE(LastName, Ch)
            END;
          IF (Ch <> ' ') AND (NOT(EOLN(INPUT)))
          THEN
            IsCorrectData := FALSE    
        END
      ELSE
        IsCorrectData := FALSE;
      RESET(LastName);  
      IF IsCorrectData
      THEN
        Copy(LastName, OUTPUT);
      IF IsCorrectData
      THEN
        BEGIN        
          WRITELN(OUTPUT, 'Enter grades of ', Student, ' student.');
          WHILE (WhichScore < NumberOfScores) AND (NOT(IsOverFlow)) AND (IsCorrectData)
          DO                                                                                
            BEGIN
              NextScore := MinNumber;
              Read(INPUT, NextScore);
              IF (NextScore >= MinNumber) AND (NextScore <= MaxNumber)
              THEN
                BEGIN
                  TotalScore := TotalScore + NextScore;
                  WhichScore := WhichScore + 1
                END
              ELSE
                IsOverFlow := TRUE 
            END;
          READLN(INPUT);
          TotalScore := TotalScore * 10;
          Ave := TotalScore DIV NumberOfScores;
          IF (NOT(IsOverFlow))
          THEN
            BEGIN
              WRITE('Average score of student ', Student, ': ');                              
              IF ((Ave MOD 10) >= 5)
              THEN
                WRITELN(OUTPUT, Ave DIV 10 + 1)
              ELSE
                WRITELN(OUTPUT, Ave DIV 10);
              ClassTotal := ClassTotal + TotalScore
            END
        END
    END;
  IF (IsCorrectData) AND (NOT(IsOverFlow))
  THEN
    BEGIN  
      WRITE(OUTPUT, 'Class average: ');
      ClassTotal := ClassTotal DIV (ClassSize * NumberOfScores);
      WRITELN(OUTPUT, ClassTotal DIV 10, '.', ClassTotal MOD 10:1)
    END
  ELSE  
    IF (NOT(IsCorrectData))
    THEN
      WRITELN(OUTPUT, 'Invalid data.')  
    ELSE
      WRITELN(OUTPUT, 'Overflow.') 
END.  {AverageScore}
