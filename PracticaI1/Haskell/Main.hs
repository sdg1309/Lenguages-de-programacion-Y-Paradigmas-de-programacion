module Main where

import qualified Data.ByteString as BS
import Data.Bits ((.&.), shiftR)
import Data.Word (Word8)
import System.Environment (getArgs)
import Text.Read (readMaybe)

data PBM = PBM
  { imageWidth :: Int
  , imageHeight :: Int
  , bytesPerRow :: Int
  , imageBytes :: BS.ByteString
  }

defaultFile :: FilePath
defaultFile = "curva_binaria_P4.pbm"

isSpaceByte :: Word8 -> Bool
isSpaceByte byte = byte `elem` [9, 10, 13, 32]

skipHeader :: BS.ByteString -> BS.ByteString
skipHeader input
  | BS.null input = input
  | isSpaceByte (BS.head input) = skipHeader (BS.tail input)
  | BS.head input == 35 = skipHeader (BS.drop 1 (BS.dropWhile (/= 10) input))
  | otherwise = input

nextToken :: BS.ByteString -> (BS.ByteString, BS.ByteString)
nextToken input =
  let content = skipHeader input
      (token, rest) = BS.span (not . isSpaceByte) content
  in (token, rest)

dropDataSeparator :: BS.ByteString -> BS.ByteString
dropDataSeparator input
  | not (BS.null input) && isSpaceByte (BS.head input) = BS.tail input
  | otherwise = input

readDecimal :: String -> String -> Either String Int
readDecimal label token =
  case readMaybe token of
    Just value | value > 0 -> Right value
    _ -> Left ("Invalid " ++ label ++ " in PBM header: " ++ token)

readPBM :: FilePath -> IO (Either String PBM)
readPBM path = do
  content <- BS.readFile path
  let (magic, afterMagic) = nextToken content
      (widthToken, afterWidth) = nextToken afterMagic
      (heightToken, afterHeight) = nextToken afterWidth
      dataBytes = dropDataSeparator afterHeight
      parse = do
        if magic /= BS.pack [80, 52]
          then Left "The file is not a binary PBM (P4)."
          else Right ()
        width <- readDecimal "width" (showBytes widthToken)
        height <- readDecimal "height" (showBytes heightToken)
        let rowBytes = (width + 7) `div` 8
            expected = rowBytes * height
        if BS.length dataBytes /= expected
          then Left ("Unexpected PBM data length: expected " ++ show expected
                     ++ ", got " ++ show (BS.length dataBytes))
          else Right (PBM width height rowBytes dataBytes)
  pure parse
  where
    showBytes = map (toEnum . fromEnum) . BS.unpack

pixel :: PBM -> Int -> Int -> Bool
pixel image x y
  | x < 0 || x >= imageWidth image || y < 0 || y >= imageHeight image = False
  | otherwise =
      let byte = BS.index (imageBytes image) (y * bytesPerRow image + x `div` 8)
          bitPosition = 7 - (x `mod` 8)
      in ((byte `shiftR` bitPosition) .&. 1) == 1

columnHeight :: PBM -> Int -> Int
columnHeight image x =
  length (takeWhile (pixel image x) [imageHeight image - 1, imageHeight image - 2 .. 0])

buildHeights :: PBM -> [Int]
buildHeights image = map (columnHeight image) [0 .. imageWidth image - 1]

calculateArea :: [Int] -> Int
calculateArea = sum

rangeFor :: Int -> Int -> Int -> (Int, Int)
rangeFor size index count =
  (index * size `div` count, ((index + 1) * size `div` count) - 1)

blockHasBlack :: PBM -> Int -> Int -> Int -> Int -> Bool
blockHasBlack image x0 x1 y0 y1 =
  any (\y -> any (\x -> pixel image x y) [x0 .. x1]) [y0 .. y1]

visualizeImage :: PBM -> IO ()
visualizeImage image = do
  let outputWidth = 96
      outputHeight = 32
      rows = [0 .. outputHeight - 1]
      renderRow outputY =
        let (y0, y1) = rangeFor (imageHeight image) outputY outputHeight
            renderCell outputX =
              let (x0, x1) = rangeFor (imageWidth image) outputX outputWidth
              in if blockHasBlack image x0 x1 y0 y1 then '#' else ' '
        in map renderCell [0 .. outputWidth - 1]
  putStrLn "Curva PBM (muestreo por bloques: 96 x 32):"
  mapM_ (putStrLn . renderRow) rows

visualizeHeights :: [Int] -> IO ()
visualizeHeights heights = do
  let outputWidth = 96
      levels = 16
      maximumHeight = max 1 (maximum heights)
      groupMaximum index =
        let (start, end) = rangeFor (length heights) index outputWidth
        in maximum (take (end - start + 1) (drop start heights))
      reduced = map groupMaximum [0 .. outputWidth - 1]
      render level = map (\height -> if height * levels `div` maximumHeight >= level then '#' else ' ') reduced
  putStrLn "Funcion de alturas M (96 grupos, 16 niveles):"
  mapM_ (putStrLn . render) [levels, levels - 1 .. 1]

showSamples :: [Int] -> IO ()
showSamples heights = do
  let count = 10
      positions = [i * (length heights - 1) `div` (count - 1) | i <- [0 .. count - 1]]
  putStrLn "Muestras distribuidas:"
  mapM_ (\x -> putStrLn ("x_" ++ show x ++ " -> f(" ++ show x ++ ") = " ++ show (heights !! x) ++ " pixels")) positions

main :: IO ()
main = do
  args <- getArgs
  let path = case args of
        [file] -> file
        _ -> defaultFile
  result <- readPBM path
  case result of
    Left errorMessage -> putStrLn ("PBM error: " ++ errorMessage)
    Right image -> do
      let heights = buildHeights image
          area = calculateArea heights
      putStrLn ("PBM P4: " ++ show (imageWidth image) ++ " x " ++ show (imageHeight image)
                ++ "; bytes per row: " ++ show (bytesPerRow image))
      visualizeImage image
      visualizeHeights heights
      showSamples heights
      putStrLn ("M tiene " ++ show (length heights) ++ " alturas.")
      putStrLn ("Area = sum M = " ++ show area ++ " square pixels (Delta x = 1).")