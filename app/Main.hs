module Main where

import  Control.Monad.IO.Class
import  AsciiConverter.Lib ( Config (Config, imageColor, imageWidth), convertToAscii, resizeImage)
import  Graphics.Image     ( readImage )


main :: IO ()
main = do
    let config = Config{imageWidth = 100, imageColor = False}
    image <- readImage "yourimage.jpg"

    case image of
        Left _ -> putStrLn "Couldn't read the image"
        Right img -> do
            let resizedImg = resizeImage (imageWidth config) img
            converted <- liftIO $ convertToAscii resizedImg config
            putStrLn converted
