import Control.Concurrent
import Data.List
import Polyrhythm
import System.Environment

main = do
  (bpm:rhythms) <- getArgs
  let delay = quot (1000000 * 60) (read bpm)
  let down_beats = downs $ map read rhythms
  mapM_ output $ zip (map signal down_beats) (repeat delay)

output (message, delay) = do
  putStrLn message
  threadDelay delay

signal True = "down!"
signal False = "up."
