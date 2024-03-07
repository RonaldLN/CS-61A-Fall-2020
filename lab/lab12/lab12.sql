.read data.sql


CREATE TABLE bluedog AS
  -- SELECT "REPLACE THIS LINE WITH YOUR SOLUTION";
  select color, pet from students where color = "blue" and pet = "dog";

CREATE TABLE bluedog_songs AS
  -- SELECT "REPLACE THIS LINE WITH YOUR SOLUTION";
  select color, pet, song from students where color = "blue" and pet = "dog";


CREATE TABLE smallest_int AS
  -- SELECT "REPLACE THIS LINE WITH YOUR SOLUTION";
  select time, smallest from students where smallest > 2 order by smallest limit 20;


CREATE TABLE matchmaker AS
  -- SELECT "REPLACE THIS LINE WITH YOUR SOLUTION";
  select a.pet, a.song, a.color, b.color from students as a, students as b
  where a.pet = b.pet and a.song = b.song and a.time < b.time;


CREATE TABLE sevens AS
  -- SELECT "REPLACE THIS LINE WITH YOUR SOLUTION";
  select a.seven from students as a, numbers as b where a.time = b.time and a.number = 7 and b.'7' = 'True';

