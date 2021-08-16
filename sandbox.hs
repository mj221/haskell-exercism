collatz :: Int -> Int

collatz n = h_collatz 0 n

h_collatz :: Int -> Int -> Int
h_collatz ans n
    | n == 1 = ans
    | even n = h_collatz (ans+1) (div n 2)
    | otherwise = h_collatz (ans+1) (3*n+1)



sumList [] = 0
sumList (n:ns) = n + sumList ns


number n = head n


validateName name= and [p c | c<- name]
    where
        p c = elem c (['a'..'z']++[' ']++['A'..'Z'])


average :: (Fractional a) => [a] -> a
-- average n = p_average n
average n = h_average 0 (fromIntegral (length n)) n

p_average :: (Fractional a) => [a] -> a
p_average [] = 0
p_average (x:xs) = (x + ((fromIntegral(length(x:xs))) - 1) * (p_average xs))/(fromIntegral(length(x:xs)))
-- p_average n
--     | (fromIntegral (length n)) > 0 = (1/(fromIntegral (length n))) * head n + p_average(tail n)
--     | otherwise = 0

h_average :: (Fractional a) => a -> a -> [a] ->  a
h_average ans n [] = ans
h_average ans n (x:xs) = h_average (x/n+ans) n xs


{- 

h_average ans n [] = ans
h_average ans n (x:xs) = h_average (x/n+ans) n xs

q4) Iteration Invariant:
h_average ans n x = ans + sum(x)/n


q5) Prove that iteration invariant holds:

LHS of Line 1: h_average ans n [] = ans + sum([])/n = ans + 0/n = ans
RHS of Line 1: ans

LHS of Line 2: h_average ans n x = h_average ans n (x:xs) = ans + sum(x:xs)/n
RHS of Line 2: h_average (x/n+ans) n xs = x/n+ans + sum(xs)/n = ans + sum(x:xs)/n = ans + sum(x)/n


q6)
quickCheck $ \xs -> average xs == sum(x)/length(x) 
quickCheck $ \xs -> and [min xs >= average xs <= max xs ] 
 -}


{- 
Q2)
type State = Int
newtype ST a = S (State -> (a,State))

apply :: ST a -> State -> (a, State)
apply (S st) x = st x

instance Functor ST where
  -- fmap :: (a -> b) -> ST a -> ST b
  fmap g st = S (\s -> let (x, s') = apply st s in (g x, s'))

instance Applicative ST where
  -- pure :: a -> ST a
  pure x = S (\s -> (x,s))

  -- (|*|) :: ST (a -> b) -> ST a -> ST b
  stf <*> stx = S(\s -> let (f, s') = apply stf s
                            (x, s'') = apply stx s'
                            in (f x, s''))


instance Monad ST where
  --  (>>=) :: ST a -> (a -> ST b) -> ST b
  st >>= f = S (\s -> let (x,s') = apply st s in apply (f x) s')
 -}

{- Q3-}
-- instance Functor [] where
--     -- fmap :: (a -> b) -> [a] -> [b]
--     fmap g xs = xs >>= (\x -> return (g x))

-- instance Applicative [] where
--     -- pure :: a -> [a]
--     pure x = do
--         return [x]

--     -- (|*|) :: [a -> b] -> [a] -> [b]
--     gs <*> xs = do
--         g <- gs
--         x <- xs
--         return (g x)
{-
Q3.3
LHS: x |*| pure y  =  pure (\g -> g y) |*| x = [y] |*| x
RHS: x |*| [y] 

LHS = RHS : [y] |*| x = x |*| [y] 

-}

{-
Q5)
map :: (a->b) -> [a] -> [b]
map f = unfold null (f.head) tail 

iterate :: (a->a) -> a -> [a]
iterate' f = unfold (const False) id f

-}



{- 
Q4)
Proving for Second Functor Law:

a. Base case
fmap g (fmap h (Leaf x)) = fmap g (Leaf $ h x)      -- Functor instance for Tree
                         = Leaf (g $ ( h $ x))      -- Functor instance for Tree
                         = Leaf ((g . h) x)         -- Definition of (.)
                         = fmap (g . h) (Leaf x)    -- Functor instance for Tree

b. Inductive Case
fmap g (fmap h (Node lt x rt)) 
= fmap g (Node (fmap h lt) (h x) (fmap h rt))
= Node (fmap g (fmap h lt)) (g (h x)) (fmap g (fmap h rt))
= Node (fmap (g.h) lt) ((g.h) x) (fmap (g.h) rt)     -- 2nd Functor law
= Node (fmap (g.h) lt x rt)                          -- Coinductive hypothesis
= fmap (g . h) (Node lt x rt)

Thus, functor satisfies the second functor law.
-}

-- n = snd . maximumBy (comparing fst) . results

-- (<#>) :: Int -> Int -> Int
-- x <#> y = x + 2*y

-- foo x = if x==1 then True else False



data PosInt = Zero | Succ PosInt
instance Eq PosInt where
  (==) Zero Zero = True
  (==) (Succ Zero) (Succ Zero) = True 
  (==) _ _ = False

instance Ord PosInt where
  Zero `compare` Zero = compare 0 0
  Zero `compare` Succ Zero = compare 0 1
  Zero `compare` Succ (Succ Zero) = compare 0 2
  (Succ (Succ Zero)) `compare` (Succ (Succ Zero)) = compare 2 2
  (Succ (Succ Zero)) `compare` Zero = compare 2 0


safeDivEach :: [Int] -> [Int] -> [Maybe Int]
safeDivEach [] _ = []
safeDivEach _ [] = []
safeDivEach (x:xs)(y:ys) 
  | x == 0 || y==0 = Nothing:safeDivEach xs ys
  | otherwise = (Just $ div x y): safeDivEach xs ys



