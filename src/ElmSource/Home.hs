{-# LANGUAGE OverloadedStrings #-}
module ElmSource.Home where

import Import

import Text.QuasiText
import Data.Text (unpack, pack)

import Language.Elm.Build
import Text.Julius
import Data.Text.Lazy.Builder (fromString)

import qualified Data.List as List
import qualified Data.Map as Map


homeModule :: String
homeModule = unpack [embed|

import Graphics.Element (..)
import Graphics.Input as Input
--import Markdown
import Signal
import Text (plainText)


main : Element
main =
  flow down
    [ message
    , Input.button (Signal.send click ()) "Redirect to elm-lang.org"
    ]


click : Signal.Channel ()
click =
  Signal.channel ()


port redirect : Signal String
port redirect =
  Signal.merge
    (Signal.constant "")
    (Signal.map (always "http://elm-lang.org") (Signal.subscribe click))


message : Element
message = plainText "Hello"





|]

--homeJS = Javascript $ fromString $ case (compileAll [homeModule]) of
--    Right s -> s
--    Left e -> error e

