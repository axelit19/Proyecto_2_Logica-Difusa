
module Main where
    import Lid
    imprimirResultados :: String -> (Bool, Bool, Bool, Bool) -> IO ()
    imprimirResultados nombre (d, e, f, g) = do
        putStrLn $ "Resultados para la funcion " ++ nombre ++ ":"
        putStrLn $ "  (d) Box Box A = Box A:             " ++ show d
        putStrLn $ "  (e) Box Diamond A = Diamond A:     " ++ show e
        putStrLn $ "  (f) Diamond Box A = Box A:         " ++ show f
        putStrLn $ "  (g) Diamond Diamond A = Diamond A: " ++ show g
        putStrLn ""

    main :: IO ()
    main = do
        putStrLn "\n=== EVALUACIÓN DE IFS ==="
        let ifs1 = IFS (\x -> triangular 0 5 10 x) (\x -> 0.5 * (1.0 - triangular 0 5 10 x))
        let ifs2 = IFS (\x -> hombroIzq 0 5 x)     (\x -> 0.5 * (1.0 - hombroIzq 0 5 x))
        let ifs3 = IFS (\x -> hombroDer 5 10 x)    (\x -> 0.5 * (1.0 - hombroDer 5 10 x))

        putStrLn "\n IFS1: Triangular 0 5 10"
        putStrLn "\n IFS2: Hombro Izquierdo 0 5"
        putStrLn "\n IFS3: Hombro Derecho 5 10"

        putStrLn "\nEvaluación de IFS1 en 3:"
        print $ evaluateIFS ifs1 3
        putStrLn "\nEvaluación de IFS2 en 3:"
        print $ evaluateIFS ifs2 3
        putStrLn "\nEvaluación de IFS3 en 3:"
        print $ evaluateIFS ifs3 3
        
        let inter = interseccion ifs1 ifs2
        putStrLn "\nIntersección de IFS1 y IFS2 : Evaluación en 3: "
        print $ evaluateIFS inter 3
        
        let uni = union ifs1 ifs2
        putStrLn "\nUnión de IFS1 y IFS2 : Evaluación en 3: "
        print $ evaluateIFS uni 3
        
        let sum = suma ifs1 ifs2
        putStrLn "\nSuma de IFS1 y IFS2 : Evaluación en 3: "
        print $ evaluateIFS sum 3
        
        let prod = producto ifs1 ifs2
        putStrLn "\nProducto de IFS1 y IFS2 : Evaluación en 3: "
        print $ evaluateIFS prod 3
        
        let boxIfs1 = necesidad ifs1
        putStrLn "\nNecesidad de IFS1 : Evaluación en 3: "
        print $ evaluateIFS boxIfs1 3
        
        let diamondIfs1 = posibilidad ifs1
        putStrLn "\nPosibilidad de IFS1 : Evaluación en 3: "
        print $ evaluateIFS diamondIfs1 3

        let boxIfs1 = necesidad ifs2
        putStrLn "\nNecesidad de IFS2 : Evaluación en 3: "
        print $ evaluateIFS boxIfs1 3
        
        let diamondIfs1 = posibilidad ifs2
        putStrLn "\nPosibilidad de IFS2 : Evaluación en 3: "
        print $ evaluateIFS diamondIfs1 3

        let boxIfs1 = necesidad ifs3
        putStrLn "\nNecesidad de IFS3 : Evaluación en 3: "
        print $ evaluateIFS boxIfs1 3
        
        let diamondIfs1 = posibilidad ifs3
        putStrLn "\nPosibilidad de IFS3 : Evaluación en 3: "
        print $ evaluateIFS diamondIfs1 3

        let x = 3

        let resultados1 = (teorema2d ifs1 x, teorema2e ifs1 x, teorema2f ifs1 x, teorema2g ifs1 x)
        let resultados2 = (teorema2d ifs2 x, teorema2e ifs2 x, teorema2f ifs2 x, teorema2g ifs2 x)
        let resultados3 = (teorema2d ifs3 x, teorema2e ifs3 x, teorema2f ifs3 x, teorema2g ifs3 x)
        
        putStrLn "\n=== DEMOSTRACIÓN DEL TEOREMA 2 ==="
        imprimirResultados "Triangular" resultados1
        imprimirResultados "Hombro Izquierdo" resultados2
        imprimirResultados "Hombro Derecho" resultados3




    


