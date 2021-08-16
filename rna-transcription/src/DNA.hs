module DNA (toRNA) where

toRNA :: String -> Either Char String
toRNA "G" = Right "C"
toRNA "C" = Right "G"
toRNA "T" = Right "A"
toRNA "A" = Right "U"
toRNA "" = Right ""
toRNA "U" = Left 'U'

toRNA xs = Right $ h_toRNA xs ""

h_toRNA (x:xs) ans
    | x == 'G' = ans ++ "C"
    | x == 'C' = ans ++ 'G'
    | x == 'T' = ans ++'A'
    | x == 'A' = ans ++ 'U'




-- G -> C
-- C -> G
-- T -> A
-- A -> U
