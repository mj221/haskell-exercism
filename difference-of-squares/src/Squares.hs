module Squares (difference, squareOfSum, sumOfSquares) where

difference :: Integral a => a -> a
difference n = squareOfSum n - sumOfSquares n

squareOfSum :: Integral a => a -> a
-- squareOfSum n = (\x -> x * x) . sumList $ [1 .. n]
squareOfSum n = m*m where
    m = n*(n+1)*2(n+1) `div` 6

sumList [] = 0
sumList (n:ns) = n + sumList ns

sumOfSquares :: Integral a => a -> a
sumOfSquares 0 = 0
sumOfSquares n = n*n + sumOfSquares(n-1)