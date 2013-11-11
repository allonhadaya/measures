import Data.List
import System.Environment

-- usage: ./measures x0 x1 .. xn
main = do
  args <- getArgs
  mapM_ (putStrLn . show) $ gaps $ map read args

-- counts up beat gaps for a polyrhythm xs
gaps xs = (tail . count_gap) $ downs xs

-- counts up beats between down beats
count_gap (True:xs) = 0 : count_gap xs
count_gap (False:xs) = let (u:us) = count_gap xs in (1 + u):us

-- marks the up beats in a polyrhythm
ups xs = map not $ downs xs

-- marks the down beats in a polyrhythm
downs xs = map (any (\x -> x == 1)) $ count xs

-- builds up parallel counts
count xs = transpose $ map (\x -> cycle [1..x]) xs
