module Planets.Types exposing (Model, Msg(..), Planet(..))

{-| This module contains the types used all over the app


# Basic Types

@docs Model, Msg


# Secondary Types

@docs Planet

-}


{-| Defines the messages used
-}
type Msg
    = WeightField String
    | NameField String
    | SelectedPlanet Planet
    | Calculate


{-| Defines the planets of the solar system
-}
type Planet
    = Mercury
    | Venus
    | Earth
    | Mars
    | Jupiter
    | Saturn
    | Uranus
    | Neptune


{-| Holds the Model of the app
-}
type alias Model =
    { nameOnEarth : String
    , weightOnEarth : Float
    , nameOnThePlanet : String
    , weightOnThePlanet : Float
    , planet : Planet
    , displayResult : Bool
    }
