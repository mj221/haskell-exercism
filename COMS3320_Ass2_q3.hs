-- foo :: a->[a] -> a
-- foo = foldl(curry snd)


foo :: a -> [a] -> a
foo ans [] = ans
foo ans (x:xs) = foo x xs