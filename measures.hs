import Data.List
import System.Environment

main = do
  args <- getArgs
  let f (x:y:_) = gaps x y in mapM_ (putStrLn . show) $ f (map read args)

-- counts up beat gaps for polyrhythm x | y
gaps x y = (tail . count_gap) $ down x y

-- builds a list of down beats
down x y = map is_down $ count x y

-- builds up parallel counts for two signatures
count x y = zip (cycle [1..x]) (cycle [1..y])

-- maps counts to down beats
is_down (1, _) = True
is_down (_, 1) = True
is_down (_, _) = False

-- counts up beats between down beats
count_gap (True:xs) = 0 : count_gap xs
count_gap (False:xs) = let (u:us) = count_gap xs in (1 + u):us
