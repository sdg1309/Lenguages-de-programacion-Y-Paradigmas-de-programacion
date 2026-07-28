main :: IO ()
main = do
  let numeros = [1, 2, 3, 4]
  putStrLn $ show numeros
  -- longitud de la lista
  print $ length numeros

  -- primer elemento de la lista
  print $ head numeros

  -- resto de la lista
  print $ tail numeros

-- estos dos ultimos generan un warning porque son acciones parciales, y si la lista esta vacia, sale un error.
