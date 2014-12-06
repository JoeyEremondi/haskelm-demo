{-# LANGUAGE TupleSections, OverloadedStrings #-}
module Handler.Home where





import Import
import ElmSource.Home

import Control.Monad (forM)


import Language.Elm.Build (deriveElmJS)
import Text.Julius
import Data.Text
import Data.Text.Lazy.Builder (fromString)

import Control.Applicative

--Need to do TH compiling in separate module
homeJS =  Javascript $ fromString $(deriveElmJS [homeModule])


-- This is a handler function for the GET request method on the HomeR
-- resource pattern. All of your resource patterns are defined in
-- config/routes
--
-- The majority of the code you will write in Yesod lives in these handler
-- functions. You can spread them across multiple files if you are so
-- inclined, or create a single monolithic file.
getHomeR :: Handler Html
-- defaultLayout uses the application's standard page layout to display
-- some contents. In our application, we're just using the standard
-- layout, which includes a basic HTML 5 page outline.
getHomeR = defaultLayout $ do
    -- Set the HTML <title> tag.
    setTitle "Yesod Web Service Homepage"

    -- Include some CDN-hosted Javascript and CSS to make our page a little nicer.
    addScriptRemote "//ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"
    addStylesheetRemote "//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css"

    -- Hamlet is the standard HTML templating language used by Yesod.
    -- In this case, we include some specific markup to take advantage of
    -- the bootstrap CSS we just included.
    -- For more information on Hamlet, please see:
    -- http://www.yesodweb.com/book/shakespearean-templates
    toWidget homeJS
    [whamlet|
        <div .container-fluid>
          <div .row-fluid>
            <h1>Haskelm Chat Demo
            <div id="Chat" style="width:50%; height:400px;">
 
          
    |]
    
    toWidget [julius|
      var stamperDiv = document.getElementById('Chat');
      Elm.embed(Elm.Chat, stamperDiv);

    |]

    -- Similar to Hamlet, Yesod has Lucius for CSS, and Julius for Javascript.
    toWidget [lucius|
        body {
            margin: 0 auto;
        }
        
        #markdowninput {
            width: 100%;
            height: 300px;
        }
        
        #markdownoutput {
            border: 1px dashed #090;
            padding: 0.5em;
            background: #cfc;
        }
    |]
    return ()


    
