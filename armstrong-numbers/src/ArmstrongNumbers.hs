module ArmstrongNumbers (armstrong) where

armstrong :: Integral a => a -> Bool
armstrong n = True


numdigits n = toInteger (round (logBase 10 (fromIntegral n)) + 1)
