f :: a -> a
f x = x



iter 0 f = f
iter n f = iter (n-1) f.f

data Tree = Leaf Int
          | Node Tree Int Tree

flatten :: Tree -> [Int]
flatten (Leaf k) = [k]
flatten (Node l k r) = flatten l ++ [k] ++ flatten r

-- -- occurs for search-ree
-- occurs' :: Int -> Tree -> Bool
-- occurs' n (Leaf k) = k == n
-- occurs' n (Node l k r) | n == k = True
--                        | n < k = occurs' n l
--                        | otherwise = occurs' n r

-- data Tree a = Leaf a | Node (Tree a) a (Tree a) deriving Show

-- -- data BTree a = Leaf | Branch a (BTree a) (BTree a) deriving Show
        
-- -- t1 = Branch 5 (Branch 4 (Branch 11 (Branch 7 Leaf Leaf) (Branch 2 Leaf Leaf)) Leaf) (Branch 8 (Branch 13 Leaf Leaf) (Branch 4 (Branch 5 Leaf Leaf) (Branch 1 Leaf Leaf) ) )      -- a simple test case.
treeA = Node (Leaf 1) 2 (Leaf 3)
treeB = Node (Leaf 9) (-10) (Node (Leaf 15) 20 (Leaf 7))

path (Leaf l) = [[l]]
-- path (Node l x (Leaf r)) = map (x:) (path l)
-- path (Node (Leaf l) x r) = map (x:) (path r)
path (Node l x r) = (x:) <$> (path l ++ path r)

-- path (Leaf a) = [x:a]
-- path (Node l x (Leaf r)) = map (x:) (path l)
-- path (Node (Leaf l) x r) = map (x:) (path r)

simpleMaxSubarray :: [Int] -> Int
simpleMaxSubarray = simpleMaxSubarray' 0 0
  where
    simpleMaxSubarray' maxSoFar maxEndingHere []     = maxSoFar     
    simpleMaxSubarray' maxSoFar maxEndingHere (x:xs) = simpleMaxSubarray' maxSoFar' maxEndingHere' xs
      where
        maxEndingHere' = max x (maxEndingHere + x)
        maxSoFar'      = max maxSoFar maxEndingHere'
