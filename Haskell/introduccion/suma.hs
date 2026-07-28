suma :: Int -> Int -> Int
suma x y = x + y

main :: IO ()
main = do
  let result = suma 2 3
  putStrLn $ "La suma es " ++ show result