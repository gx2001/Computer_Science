statistics :: [(Int,Int)]->(Int,Int,Int,Int,Int)
statistics s 
	|s==[]
		=(0,0,0,0,0)
	|s==[(0,0)]
		=(0,0,0,0,0)
	|otherwise
		=(myLength(s),myWins(s),numGoalsA(s),numGoalsB(s),bestResult(s))

	
myLength :: [(Int,Int)]->Int
myLength [] = 0
myLength (x:xs) = (+1) (myLength xs)


myWins :: [(Int,Int)] -> Int
myWins [] = 0
myWins (h:t) = (+new h) (myWins t)

new :: (Int,Int)->Int
new (a,b)  
	| (a>b)
		= 3
	| (a==b)
		= 1
	|otherwise
		= 0


numGoalsA :: [(Int,Int)]->Int
numGoalsA []=0
numGoalsA(h:t) =(+countGoalsA h) (numGoalsA t)


countGoalsA::(Int,Int)->Int
countGoalsA (a,b)=a


numGoalsB :: [(Int,Int)]->Int
numGoalsB [] = 0
numGoalsB (h:t) = (+countGoalsB h) (numGoalsB t)


countGoalsB :: (Int,Int)->Int
countGoalsB (a,b)=b

bestResult :: [(Int,Int)] -> Int
bestResult []=0
bestResult (h:t) 
	|(new h)==3
		=new1(maxIntList(h:t)) 
				
	|(new h)==1
		= (+0) (bestResult t)
	|otherwise
		=(+new1(maxIntList(h:t))) (bestResult t)


new1 :: (Int,Int)->Int
new1 (a,b)
	|(a>b)
		=(a-b)
	|(a<b)
		=(-1*(a-b))
	|otherwise 
		=0

maxIntList :: [(Int,Int)]-> (Int,Int)
maxIntList (h:[]) = h
maxIntList (h:t) = max h (maxIntList t)	


---------------------------------------------------------------------------------------------------------------------


subString :: String -> [[String]]
subString [] = []
subString [x]   = [[[x]]]
subString (x : xs) = [(x : u) : us | (u : us) <- subString xs] ++ [[x] : u | u <- subString xs]

deleteFirstElement :: [[String]] -> [[String]]
deleteFirstElement (h:t)
	|length(t)==0
		=[]
	|otherwise
		=t


partition :: String->[[String]]
partition x = deleteFirstElement(subString x )



















