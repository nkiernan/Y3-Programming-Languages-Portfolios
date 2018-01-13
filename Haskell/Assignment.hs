-- imports
import Data.Char
import Data.List
import Data.Function

-- list of common words
commonWords = ["the","and","have","not","as","be","a","i","on","you","to","in","it","with","do","of","that","for","he","at"]

-- change string to lower case
toLowerStr xs = map toLower xs

-- non non-alphabetical characters
dropNonLetters xs = filter (\x -> x `elem` ['a'..'z']) xs

-- change string to list of words
toWordList xs = sort $ filter (not . null) $ map dropNonLetters $ words $ toLowerStr xs

-- count common words in list of strings
countCommonWords xs = length $ filter (\x -> elem x commonWords) xs

-- remove common words from a list of strings
dropCommonWords xs = filter (\x -> notElem x commonWords) xs

-- count occurrence of each word in list of strings
countWords xs = map (\w -> (head w, length w)) $ group $ sort xs

-- sort occurrence of each word by descending order
sortWords xs = sortBy (flip compare `on` snd) $ sortBy (flip compare `on` fst) xs

-- generate histogram of up to 20 words
toAsteriskBar x = (replicate (snd x) '*') ++ " -> " ++ (fst x) ++ "\n"
makeHistogram xs = concat $ map toAsteriskBar $ take 20 xs

-- main
main = do
  putStrLn "Introduce a filename:"
  fname <- getLine
  textdata <- readFile fname
  let wordlist = toWordList textdata
  putStrLn "Report:"
  putStrLn ("\t" ++ (show $ length wordlist) ++ " words")
  putStrLn ("\t" ++ (show $ countCommonWords wordlist) ++ " common words")
  putStrLn "\nHistogram of the most frequent words (excluding common words):"
  putStr $ makeHistogram $ sortWords $ countWords $ dropCommonWords $ wordlist