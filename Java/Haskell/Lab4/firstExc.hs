move :: Eq u => [u]->u->Int->[u]
move s x n =
	if (isElement x s ==True) && (myLength(s)>0) then 
		if  (n>0 && ((myLength s )-(findPos s x ) > n)) then move (simpleShiftRight x s) x (n-1) 
			
			else s
			
		else []  


simpleShiftRight :: (Eq a) => a -> [a] -> [a]
simpleShiftRight x (y:z:rest) | x == y    = z:y:rest
                              | otherwise = y : simpleShiftRight x (z:rest)
simpleShiftRight _ rest                   = rest 	
	
	
	
myLength :: Eq u => [u] -> Int
myLength [] = 0 
myLength (x:xs) = (+1) (myLength xs)


isElement :: Eq u => u -> [u] -> Bool
isElement u [] = False
isElement u (x:xs)
  | u == x = True
  | otherwise = isElement u xs

findPos :: Eq u => [u] -> u -> Int
findPos list elt | list == [] = -1
                 | head list == elt = 0
                 | otherwise = 1 + (findPos (tail list) elt)

 
