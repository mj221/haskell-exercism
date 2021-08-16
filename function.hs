


-- foo True x _ = x
-- foo False _ y = y


-- bar b x y = if b then x else y


exists xs p = undefined


isPrime k = if k > 1 then null [ x | x <- [2..k - 1], k `mod` x == 0] else False


-- con xs ys = [[(x,y) | x <- xs, y <- ys]]
con xs ys = concat [[(x,y) | x <- xs ]| y <- ys]



bon p g ys = map g $ (filter p ys)

-- ordered :: Eq a => [a] -> Bool

ordered xs = foldr (||) True . map (xs >=)


foo :: [Int] -> [Int]
foo []       = []
foo [x]      = [abs x]
foo (x:y:xs) = (abs x) : y : foo xs

bar :: [Int] -> [Int]
bar []       = []
bar [x]      = [x+1]
bar (x:y:xs) = (x+1) : y : bar xs

-- vrb :: (a -> a) -> [a] -> [a]
vrb f [] = []
vrb f [x] = [f x]
vrb f (x:y:xs) = (f x) : y : vrb f xs 
p_vrb xs = and [ (foo xs == vrb abs xs), (bar xs == vrb (+1) xs) ]


data Suit = Hearts | Clubs | Diamonds | Spades deriving Eq
data Rank = Numeric Int | Jack | Queens | King | Ace deriving Eq
data Card = NormalCard Rank Suit | Joker deriving Eq

-- countAces :: [Card] -> Int

-- countAces (c:cs) = length cs
--     where
--         countAces (cs) if c != [Joker] el

reverseList = go []
    where
        go acc [] = acc
        go acc (x:xs) = go (x:acc) xs
