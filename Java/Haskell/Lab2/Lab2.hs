
-----------------------------------------------------------------------------------------

-- ASKHSH 1

nearest :: [Int]->Int->Int
nearest [] number =
	error "Empty List"
nearest (h:t) number = elemIntList (insertDifList (h:t) number) (minIntList (insertDifList (h:t) number)) 1

insertDifList :: [Int] -> Int -> [Int]
insertDifList [] number = []
insertDifList (h:t) number = absInt (h-number) : insertDifList t number

elemIntList :: [Int] -> Int -> Int -> Int
elemIntList (h:t) n index
	| (h == n) && (index == 1)
		= 1
	| h == n
		= index
	| otherwise
		= elemIntList t n (index+1)

minIntList :: [Int] -> Int
minIntList (h:[]) = h
minIntList (h:t) = min h (minIntList t)

absInt :: Int -> Int
absInt n
	| n > 0
		= n
	| otherwise
		= negate n

-----------------------------------------------------------------------------------------
     
-- ASKHSH 2

smooth :: [Int]->Int->[Int]
smooth [] k = []
smooth (h:t) k
	| k > length (h:t)
		= []
	| otherwise
		= calcResult (h:t) k

calcResult:: [Int] -> Int -> [Int]
calcResult (h:t) k = deleteKlastElements (calcMOList (h:t) k) k

calcMOList:: [Int] -> Int -> [Int]
calcMOList [] k = [0]
calcMOList (h:t) 0 = [0]
calcMOList (h:t) k = ((h + (sumIntList t (k-1))) `div` k) : calcMOList t k

deleteKlastElements:: [Int] -> Int -> [Int]
deleteKlastElements [] k = []
deleteKlastElements (h:t) 0 = (h:t)
deleteKlastElements (h:t) k = deleteKlastElements (init (h:t)) (k-1)

sumIntList :: [Int] -> Int -> Int
sumIntList [] k = 0
sumIntList (h:t) 0 = 0
sumIntList (h:t) k = h + (sumIntList t (k-1))

-----------------------------------------------------------------------------------------
     
-- ASKHSH 3

swap :: String->String
swap (h:t)
	| length (splitStr (h:t)) == 1
		= (h:t)
	| length (splitStr (h:t)) `mod` 2 /= 0
		= createTheFinalStr (removeSpace (splitStr (removeLastSpaces (createTheFinalStr (createTheFinalList (createThePairs (splitStrToEvenAndOdd (splitStr (h:t)))))))))
	| otherwise
		= createTheFinalStr (createTheFinalList (createThePairs (splitStrToEvenAndOdd (splitStr (h:t)))))

removeSpace:: [String] -> [String]
removeSpace (h:a:b:t) = h:a:t

removeLastSpaces:: String -> String
removeLastSpaces (h:t)
	| last (h:t) == ' '
		= removeLastSpaces (init (h:t))
	| otherwise
		= (h:t)

splitStr :: String -> [String]
splitStr [] = [""]
splitStr (h:t)
	| h == ' '
		= "" : (splitStr t)
	| otherwise
		= (h : head (splitStr t)) : tail (splitStr t)

splitStrToEvenAndOdd :: [String] -> ([String],[String])
splitStrToEvenAndOdd (a:b:t) = (b:r,a:s)
	where (r,s) = splitStrToEvenAndOdd t
splitStrToEvenAndOdd s = ([],s)			

createThePairs:: ([String],[String]) -> [(String,String)]
createThePairs (b:r,a:s) = (b,a) : makePairsStr r s

insertLast:: String -> [String] -> [String]
insertLast a [] = [a]
insertLast a (h:t) = h : insertLast a t

makePairsStr :: [String] -> [String] -> [(String,String)]
makePairsStr (h1:t1) (h2:t2) = (h1,h2) : makePairsStr t1 t2
makePairsStr [] (h2:t2) = ([],h2) : makePairsStr [""] [""]
makePairsStr r s = []

createTheFinalList :: [(String,String)] -> [String]
createTheFinalList ((a,b):t) = a : b : createTheFinalList t
createTheFinalList [] = []

createTheFinalStr :: [String] -> String
createTheFinalStr (h:[]) = h
createTheFinalStr [] = ""
createTheFinalStr (h:t) = h ++ " " ++ createTheFinalStr t

-----------------------------------------------------------------------------------------
     
-- ASKHSH 4

mapi :: [u]->(u->Int->v)->[v]
mapi s f = []

mapIntList :: (Int -> Int) -> [Int] -> [Int]
mapIntList f [] = []
mapIntList f (h:t) = f h : (mapIntList f t)