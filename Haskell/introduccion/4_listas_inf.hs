main :: IO ()
main = do
  -- Se define una lista de los números del 1 al 10
  let naturales = [1..10]

  -- Se define una lista infinita
  let infinitos = [1..]

  -- Se imprime los primeros 10 elementos de la lista
  putStrLn $ "Primeros 10 naturales: " ++ show (take 10 naturales)

-- Se defina ina lista con un patron de 3 en 3 como
  let tresEnTres = [3,6..30]
  putStrLn $ "Números del 3 al 30 de 3 en 3: " ++ show tresEnTres
