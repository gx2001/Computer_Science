combine :: [u]->[v]->(u->v->w)->(u->v->w)->(Int->Bool)->[w]
combine s t f g h 
	|myLength (s)==0 || myLength(t)==0
		=[]
	|otherwise
		=combine1 s t f g h 1

combine1 :: [u]->[v]->(u->v->w)->(u->v->w)->(Int->Bool)->Int->[w]
combine1 (sh:st) (th:tt) f g h count
	|h count
		=(f sh th ):(combine1 st tt f g h (count+1))
	|otherwise
		=(g sh th):(combine1 st tt f g h (count+1))


myLength :: [u] -> Int
myLength [] = 0 
myLength (x:xs) = (+1) (myLength xs)