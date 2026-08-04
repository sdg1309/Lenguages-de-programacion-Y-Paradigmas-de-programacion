main :: IO ()
main = do
  -- Se define una lista de números
  let numeros = [1, 2, 3, 4]

  -- Se define una lista de tuplas
  let tuplas = [(1, 2), (3, 4), (5, 6)]

  -- Las String se comportan como una lista de caracteres
  let string = "puppies"

  -- Se imprime la lista completa
  putStrLn $ "Números: " ++ show numeros

  -- Se imprime la lista de tuplas
  putStrLn $ "Tuplas: " ++ show tuplas

  -- longitud de la lista
  putStrLn $ "Longitud: " ++ show (length numeros)

  -- primer elemento de la lista
  putStrLn $ "Primer elemento: " ++ show (head numeros)

  -- resto de la lista
  putStrLn $ "Resto de la lista: " ++ show (tail numeros)

  -- el valor minimo de la lista
  putStrLn $ "Minimo: " ++ show (minimum numeros)

  -- el valor maximo de la lista
  putStrLn $ "Maximo: " ++ show (maximum numeros)

  -- buscar un elemento especifico en la lista
  putStrLn $ "Elemento 3 en la lista: " ++ show (elem 3 numeros)

  -- take es tomar los primeros n elementos de la lista
  putStrLn $ "Primeros 2 elementos: " ++ show (take 2 numeros)

  -- drop es omitir los primeros n elementos de la lista
  putStrLn $ "Despues de omitir 2 elementos: " ++ show (drop 2 numeros)

  -- takeLast es tomar los últimos n elementos de la lista
  -- putStrLn $ "Últimos 2 elementos: " ++ show (takeLast 2 numeros)

{- estos dos ultimos generan un warning porque son acciones parciales,
 y si la lista esta vacia, sale un error. -}

 -- Como agregar elementos a una lista
  let agregado = 0:numeros
  putStrLn $ "Con elemento agregado al inicio: " ++ show agregado

 -- Concatenacion de listas siempre con ++
 -- Estos elementos siempre van al final de la lista
  let concatenada = numeros ++ [5, 6]
  putStrLn $ "Concatenacion: " ++ show concatenada

  -- El operador indice !! para sacar un elemento especifico de la lista
  -- Recordar que el indice comienza en 0
  putStrLn $ "Elemento en el indice 2: " ++ show (numeros !! 2)

  -- Uso de una String como lista de caracteres
  putStrLn $ "Primer caracter de la String: " ++ show (string !! 0)

  -- Longitud de la String
  putStrLn $ "Longitud de la String: " ++ show (length string)

