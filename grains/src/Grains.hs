module Grains (square, total) where

square :: Integer -> Maybe Integer
square n 
    | n > 0 = Just $ (^) 2 (n-1)
    | n == 0 = Nothing
    | otherwise = Nothing

sumOfSquares :: Integral a => a -> a
sumOfSquares 0 = 0
sumOfSquares 1 = 1
sumOfSquares n = 2^(n-1) + sumOfSquares(n-1)

total :: Integer
total = sumOfSquares 64
