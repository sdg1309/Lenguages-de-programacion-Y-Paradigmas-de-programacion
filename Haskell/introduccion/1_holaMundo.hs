main :: IO ()
main = do
  -- Se imprime en pantalla con putStrLn
  putStrLn "hello world"
  
  -- Las Variables se definen con let
  let x = 5

  -- Se puede imprimir valores de variables con "$ show" para volverlos String
  putStrLn $ show x