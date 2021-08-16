module SpaceAge (Planet(..), ageOn) where

data Planet = Mercury
            | Venus
            | Earth
            | Mars
            | Jupiter
            | Saturn
            | Uranus
            | Neptune

ageOn :: Planet -> Float -> Float
ageOn Mercury seconds = ageOn Earth seconds / 0.2408467
ageOn Venus seconds = ageOn Earth seconds / 0.61519726
ageOn Earth seconds = seconds / 31557600






