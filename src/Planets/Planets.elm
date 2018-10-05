module Planets exposing (main)

{-| Main of the app


# Definition

@docs main

-}

import Planets.Types exposing (Model, Msg)
import Planets.View exposing (view)
import Planets.State exposing (init, update, subscriptions)
import Html exposing (program)


-- Entry point


{-| Used as the entry point
-}
main : Program Never Model Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
