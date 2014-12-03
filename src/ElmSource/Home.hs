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

import Graphics.Input as Input
import Graphics.Element (flow, down, Element)
import Signal (..)
import Text (plainText)

main : Element
main =
    flow down
        [ message
        --, Input.button click.handle () "Go to chat!"
        ]

click : Channel ()
click = channel ()

port redirect : Signal String
port redirect =
    merge
        (constant "")
        (always "chat/testRoom" <~ click.signal)

message : Element
message = plainText "Enter the name of the chat room to go to (or create)"


|]

