import Data.List
import Polyrhythm
import System.Environment

main = do
  signatures <- getArgs
  let down_beats = downs $ map read signatures
  mapM_ putStrLn $ map signal down_beats

signal True = "down"
signal False = "up"
