PROGRAM AverageScore(INPUT, OUTPUT);
CONST
  NumberOfScores = 4;                               
  ClassSize = 4;
TYPE
  Score = 0 .. 100;
VAR
  WhichScore: 0 .. NumberOfScores;
  Student: 0 .. ClassSize;
  NextScore: Score;
  Ave, TotalScore, ClassTotal, Error: INTEGER;
  Ch: CHAR;
BEGIN {AverageScore}
  ClassTotal := 0;
  WRITELN('Student averages:');
  Student := 0;              
  WHILE (Student < ClassSize)
  DO                                                                         
    BEGIN                    
      Student := Student + 1;
      TotalScore := 0;
      WhichScore := 0;      
      WRITELN('Enter grades of ', Student, ' student.');
      WHILE (WhichScore < NumberOfScores) 
      DO                                                                                
        BEGIN
          NextScore := 0;
          IF NOT(EOLN)
          THEN    
            BEGIN                                                     
              READ(Ch);
              IF (Ch >= '0') AND (Ch <= '9')
              THEN
                BEGIN
                  Val(Ch, NextScore, Error);
                  WhichScore := WhichScore + 1 
                END
            END
          ELSE
            READLN; 
          TotalScore := TotalScore + NextScore
        END;
      READLN;
      TotalScore := TotalScore * 10;
      Ave := TotalScore DIV NumberOfScores;
      WRITE('Average score of student ', Student, ': ');                              
      IF (Ave MOD 10) >= 5
      THEN
        WRITELN(Ave DIV 10 + 1)
      ELSE
        WRITELN(Ave DIV 10);
      ClassTotal := ClassTotal + TotalScore
    END;
  WRITELN('Class average:');
  ClassTotal := ClassTotal DIV (ClassSize * NumberOfScores);
  WRITELN(ClassTotal DIV 10, '.', ClassTotal MOD 10:1)
END.  {AverageScore}
