module Polyrhythm (gaps, ups, downs) where

import Data.List

-- counts up beat gaps for a polyrhythm xs
gaps :: [Int] -> [Int]
gaps xs = (tail . count_gap) $ downs xs

-- counts up beats between down beats
count_gap (True:xs) = 0 : count_gap xs
count_gap (False:xs) = let (u:us) = count_gap xs in (1 + u):us

-- marks the up beats in a polyrhythm
ups :: [Int] -> [Bool]
ups xs = map not $ downs xs

-- marks the down beats in a polyrhythm
downs :: [Int] -> [Bool]
downs xs = map (any (\x -> x == 1)) $ count xs

-- builds up parallel counts
count xs = transpose $ map (\x -> cycle [1..x]) xs
