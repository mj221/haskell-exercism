module Clock (addDelta, fromHourMin, toString) where

import Text.Printf
data Clock = Time Int Int
  deriving (Eq, Show)

fromHourMin :: Int -> Int -> Clock
fromHourMin hour min = Time hour' min'
  where
    (bumpH, min') = divMod min 60
    hour' = mod(hour + bumpH) 24

toString :: Clock -> String
toString (Time hour min) = printf "%02d:%02d" hour min 

addDelta :: Int -> Int -> Clock -> Clock
addDelta hour min (Time h m) = fromHourMin (hour+h) (min+m)

