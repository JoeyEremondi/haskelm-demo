{-# LANGUAGE OverloadedStrings #-}
module ElmSource.Chat where

import Import

import Text.QuasiText
import Data.Text (unpack, pack)

import Language.Elm.Build
import Text.Julius
import Data.Text.Lazy.Builder (fromString)

import qualified Data.List as List
import qualified Data.Map as Map


chatModule :: String
chatModule = unpack [embed|
module Chat where

import Text (plainText)

main = plainText "Hello"
|]

