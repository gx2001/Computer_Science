shift :: Eq a => a->[a]->Int->[a]
shift x lst n = if n == 0 then delete x lst 
                else insert x (n + (position x lst)) (delete x lst)


delete :: Eq a => a->[a]->[a]
delete x []          = []
delete x (head:tail) = if x == head then tail else head : delete x tail


position :: Eq a => a->[a]->Int
position x (head:tail) = if x == head then 1 else 1 + position x tail

insert :: a->Int->[a]->[a]
insert x n (head:tail) = if n <= 1 then x : (head:tail) 
                         else head : (insert x (n-1) tail)
insert x n lst          = if n >= length lst then lst ++ [x] 
                         else insert x n lst


move :: Eq u => [u]->u->Int->[u]
move s x n
	|myLength(s)==0
		=[]
	|(isElement x s ==True) && (myLength(s)>0) && (n>0) 
		= shift x s n
	|(isElement x s ==True) && (myLength(s)>0) && (n==0)
		= shift x s n 
	|(isElement x s ==True) && (myLength(s)>0) && (n<0)
		= shift x s n 
	|otherwise 
		= s


isElement :: Eq u => u -> [u] -> Bool
isElement u [] = False
isElement u (x:xs)
  | u == x = True
  | otherwise = isElement u xs


myLength :: Eq u => [u] -> Int
myLength [] = 0 
myLength (x:xs) = (+1) (myLength xs)



-------------------------------------------------------------------------------------

combine :: [u]->[v]->(u->v->w)->(u->v->w)->(Int->Bool)->[w]
combine s t f g h 
	|myLength1 (s)==0 || myLength1(t)==0
		=[]
	|otherwise
		=combine1 s t f g h 1

combine1 :: [u]->[v]->(u->v->w)->(u->v->w)->(Int->Bool)->Int->[w]
combine1 (sh:st) (th:tt) f g h c
	|h c
		=(f sh th ):(combine1 st tt f g h (c+1))
	|otherwise
		=(g sh th):(combine1 st tt f g h (c+1))


myLength1 :: [u] -> Int
myLength1 [] = 0 
myLength1 (x:xs) = (+1) (myLength1 xs)