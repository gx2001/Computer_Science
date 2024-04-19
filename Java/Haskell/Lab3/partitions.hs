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


myLength :: [[String]]->Int
myLength [] = 0
myLength (x:xs) = (+1) (myLength xs)



