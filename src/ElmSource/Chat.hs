{-# LANGUAGE OverloadedStrings #-}
module ElmSource.Chat where

import Text.QuasiText
import Data.Text (unpack, pack)

import Language.Elm.Build
import Text.Julius
import Data.Text.Lazy.Builder (fromString)

chatModule :: String
chatModule = unpack [embed|
module Chat where

main = plainText "Hello"
|]

chatJS = Javascript $ fromString $ case (compileAll [chatModule]) of
    Right s -> s
    Left e -> error e
