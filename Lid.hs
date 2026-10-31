module Lid where

    data IFS a = IFS { mu :: a -> Double, nu :: a -> Double}


    evaluateIFS :: IFS a -> a -> Maybe (Double, Double)
    evaluateIFS (IFS mu nu) x=
        let m= mu x
            n = nu x
        in if  m>= 0 && n >= 0 && (m + n )<= 1.0
            then Just (m, n)
            else Nothing
    
    indeterminacion :: IFS a -> a -> Double
    indeterminacion (IFS mu nu) x = 1.0 - mu x - nu x

    interseccion:: IFS a -> IFS a -> IFS a
    interseccion (IFS mu1 nu1) (IFS mu2 nu2) =
        IFS (\x -> min (mu1 x) (mu2 x)) (\x -> max (nu1 x) (nu2 x))

    union:: IFS a -> IFS a -> IFS a
    union (IFS mu1 nu1) (IFS mu2 nu2) =
        IFS (\x -> max (mu1 x) (mu2 x)) (\x -> min (nu1 x) (nu2 x))
    
    suma:: IFS a -> IFS a -> IFS a
    suma (IFS mu1 nu1) (IFS mu2 nu2) =
        IFS (\x -> mu1 x + mu2 x - mu1 x * mu2 x) (\x -> nu1 x * nu2 x)

    producto:: IFS a -> IFS a -> IFS a
    producto (IFS mu1 nu1) (IFS mu2 nu2) =
        IFS (\x -> mu1 x * mu2 x) (\x -> nu1 x + nu2 x - nu1 x * nu2 x)
    
    necesidad:: IFS a -> IFS a
    necesidad (IFS mu _) = IFS mu (\x -> 1.0 - mu x)

    posibilidad:: IFS a -> IFS a
    posibilidad (IFS _ nu)=IFS (\x -> 1.0 - nu x) nu

    igualdad:: IFS a -> IFS a -> a -> Bool
    igualdad (IFS mu1 nu1) (IFS mu2 nu2) x =
        let epsilon = 1e-9
        in abs (mu1 x - mu2 x) < epsilon && abs (nu1 x - nu2 x) < epsilon

    teorema2d:: IFS a -> a -> Bool
    teorema2d ifs x =
        let box = necesidad
            diamond = posibilidad
        in igualdad (box (box ifs)) (box ifs) x
    
    teorema2e:: IFS a -> a -> Bool
    teorema2e ifs x =
        let box = necesidad
            diamond = posibilidad
        in igualdad (box (diamond ifs)) (diamond ifs) x
    
    teorema2f:: IFS a -> a -> Bool
    teorema2f ifs x =
        let box = necesidad
            diamond = posibilidad
        in igualdad (diamond (box ifs)) (box ifs) x
    
    teorema2g:: IFS a -> a -> Bool
    teorema2g ifs x =
        let box = necesidad
            diamond = posibilidad
        in igualdad (diamond (diamond ifs)) (diamond ifs) x
    
    {-Funciones clasicas de conjuntos disfusos-}

    triangular :: Double -> Double -> Double -> Double -> Double
    triangular a b c x
        | x <= a || x >= c = 0.0
        | x > a && x <= b  = (x - a) / (b - a)
        | x > b && x < c   = (c - x) / (c - b)
        | otherwise        = 0.0


    hombroIzq :: Double -> Double -> Double -> Double
    hombroIzq a b x
        | x <= a    = 1.0
        | x >= b    = 0.0
        | otherwise = (b - x) / (b - a)


    hombroDer :: Double -> Double -> Double -> Double
    hombroDer a b x
        | x <= a    = 0.0
        | x >= b    = 1.0
        | otherwise = (x - a) / (b - a)
    



    

    
      







    


