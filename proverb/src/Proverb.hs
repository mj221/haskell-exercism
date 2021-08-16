module Proverb(recite) where

recite :: [String] -> String
recite [] = ""
recite [s] = "And all for the want of a " ++ s ++ "."
recite (xs:yx:ys) = recite' (xs:yx:ys) ++ recite[xs]
    where
        recite' [] = ""
        recite' (xs:yx:ys) = "For want of a " ++ xs ++ " the " ++ yx ++ " was lost.\n" ++ recite'(yx:ys)
        recite' [_] = ""

