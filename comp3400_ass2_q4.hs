data Nat = Zero | Succ Nat deriving Show
emb :: Nat -> Int
emb Zero = 0
emb (Succ n) = 1 + emb n

plus :: Nat -> Nat -> Nat
plus n Zero = n
plus n (Succ m) = plus (Succ n) m

times ::Nat -> Nat -> Nat
times _ Zero = Zero
times n (Succ m) = plus n $ times n m