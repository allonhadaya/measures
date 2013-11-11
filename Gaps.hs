import Polyrhythm
import System.Environment

-- usage: ./gaps x0 x1 .. xn
main = do
  args <- getArgs
  mapM_ (putStrLn . show) $ gaps $ map read args
