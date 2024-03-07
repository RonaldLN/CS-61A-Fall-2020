CREATE TABLE parents AS
  SELECT "abraham" AS parent, "barack" AS child UNION
  SELECT "abraham"          , "clinton"         UNION
  SELECT "delano"           , "herbert"         UNION
  SELECT "fillmore"         , "abraham"         UNION
  SELECT "fillmore"         , "delano"          UNION
  SELECT "fillmore"         , "grover"          UNION
  SELECT "eisenhower"       , "fillmore";

CREATE TABLE dogs AS
  SELECT "abraham" AS name, "long" AS fur, 26 AS height UNION
  SELECT "barack"         , "short"      , 52           UNION
  SELECT "clinton"        , "long"       , 47           UNION
  SELECT "delano"         , "long"       , 46           UNION
  SELECT "eisenhower"     , "short"      , 35           UNION
  SELECT "fillmore"       , "curly"      , 32           UNION
  SELECT "grover"         , "short"      , 28           UNION
  SELECT "herbert"        , "curly"      , 31;

CREATE TABLE sizes AS
  SELECT "toy" AS size, 24 AS min, 28 AS max UNION
  SELECT "mini"       , 28       , 35        UNION
  SELECT "medium"     , 35       , 45        UNION
  SELECT "standard"   , 45       , 60;


-- The size of each dog
CREATE TABLE size_of_dogs AS
  -- SELECT "REPLACE THIS LINE WITH YOUR SOLUTION";
  select dogs.name as name, sizes.size as size from dogs, sizes 
  where dogs.height > sizes.min and dogs.height <= sizes.max;


-- All dogs with parents ordered by decreasing height of their parent
CREATE TABLE by_parent_height AS
  -- SELECT "REPLACE THIS LINE WITH YOUR SOLUTION";
  select a.child from parents as a, dogs as b
  where b.name = a.parent order by b.height*-1; 


-- Filling out this helper table is optional
CREATE TABLE siblings AS
  -- SELECT "REPLACE THIS LINE WITH YOUR SOLUTION";
  select a.child as first_child, b.child as second_child from parents as a, parents as b
  where a.child < b.child and a.parent = b.parent;

-- Sentences about siblings that are the same size
CREATE TABLE sentences AS
  -- SELECT "REPLACE THIS LINE WITH YOUR SOLUTION";
  select "The two siblings, "||a.first_child||" plus "||a.second_child||" have the same size: "||b.size 
  from siblings as a, size_of_dogs as b, size_of_dogs as c 
  where a.first_child = b.name and a.second_child = c.name and b.size = c.size;

