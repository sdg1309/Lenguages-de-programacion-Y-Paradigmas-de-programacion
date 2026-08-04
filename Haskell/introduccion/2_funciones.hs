-- Se declara la funcion suma, con entrada de dos enteros (Int) y salida de un entero (Int)
suma :: Int -> Int -> Int
suma x y = x + y

-- Se declara la funcion resta, con entrada de dos enteros (Int) y salida de un entero (Int)
resta :: Int -> Int -> Int
resta x y = x - y

-- Se declara la funcion multiplicacion, con entrada de dos enteros (Int) y salida de un entero (Int)
multiplicacion :: Int -> Int -> Int
multiplicacion x y = x * y

main :: IO ()
main = do
  let x = 2
  let y = 3
  -- Se realizan operaciones con las funciones definidas
  -- resultSuma :: Int
  let resultSuma = suma x y
  putStrLn $ "La suma de " ++ show x ++ " y " ++ show y ++ " es " ++ show resultSuma

  -- resultResta :: Int
  let resultResta = resta x y
  putStrLn $ "La resta de " ++ show x ++ " y " ++ show y ++ " es " ++ show resultResta

  -- resultMult :: Int
  let resultMult = multiplicacion x y
  putStrLn $ "La multiplicación de " ++ show x ++ " y " ++ show y ++ " es " ++ show resultMult