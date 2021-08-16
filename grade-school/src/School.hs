module School (School, add, empty, grade, sorted) where

data School = School [(Int, [String])]
    deriving Show
    
add :: Int -> String -> School -> School
add gradeNum student (School [(g, st)]) = School [(gradeNum, st ++ [student])] where 
    gradeNum = g

empty :: School
empty = School []

grade :: Int -> School -> [String]
grade gradeNum school = error "You need to implement this function."

sorted :: School -> [(Int, [String])]
sorted school = error "You need to implement this function."


