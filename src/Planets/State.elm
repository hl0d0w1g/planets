module Planets.State exposing (init, update, subscriptions)

{-| This module contains the logic controlling the state of the module


# Definitions

@docs init, update, subscriptions

-}

import Planets.Types exposing (Model, Msg(..), Planet(..))
import Planets.Utils exposing (calcName, calcWeight)


{-| Defines the input model and Command for the initialization.
-}
init : ( Model, Cmd Msg )
init =
    ( initialModel, Cmd.none )


initialModel : Model
initialModel =
    { nameOnEarth = ""
    , weightOnEarth = 0.0
    , nameOnThePlanet = ""
    , weightOnThePlanet = 0.0
    , planet = Earth
    , displayResult = False
    }


{-| Updates the model when actions are triggered
-}
update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        WeightField weight ->
            ( { model
                | weightOnEarth = Result.withDefault 0 (String.toFloat weight)
                , displayResult = False
              }
            , Cmd.none
            )

        NameField name ->
            ( { model
                | nameOnEarth = name
                , displayResult = False
              }
            , Cmd.none
            )

        SelectedPlanet planet ->
            ( { model
                | planet = planet
                , displayResult = False
              }
            , Cmd.none
            )

        Calculate ->
            ( { model
                | nameOnThePlanet = calcName model
                , weightOnThePlanet = calcWeight model
                , displayResult = True
              }
            , Cmd.none
            )


{-| Used for listing for external input. Main entry point makes it
necessary to define
-}
subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none
