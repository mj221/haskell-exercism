-- expDown :: Int -> Int -> Int
-- expDown x y = h_exp x y 1

-- h_exp :: Int -> Int -> Int -> Int
-- h_exp x 0 ans = ans
-- h_exp x y ans = h_exp x (y-1) (ans * x)


expUp :: Int -> Int -> Int
expUp x y = h_exp x y 1

h_exp :: Int -> Int ->Int -> Int
h_exp x 0 ans = ans
h_exp x y ans = h_exp x ((negate . abs) y + 1) (ans * x)
