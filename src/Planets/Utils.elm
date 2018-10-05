module Planets.Utils exposing (calcName, calcWeight, planetToString)

{-| This module contains the common functions of the app


# Definition

@docs calcName, calcWeight, planetToString

-}

import Planets.Types exposing (Model, Msg(..), Planet(..))


{-| Calculate the name on the chosen planet
-}
calcName : Model -> String
calcName model =
    case model.planet of
        Mercury ->
            String.dropRight 2 model.nameOnEarth

        Venus ->
            String.reverse model.nameOnEarth

        Earth ->
            model.nameOnEarth

        Mars ->
            String.right 2 model.nameOnEarth

        Jupiter ->
            String.toUpper model.nameOnEarth

        Saturn ->
            String.left 2 model.nameOnEarth

        Uranus ->
            String.append model.nameOnEarth "ito"

        Neptune ->
            String.dropLeft 2 model.nameOnEarth


{-| Calculate the weight on the chosen planet
-}
calcWeight : Model -> Float
calcWeight model =
    case model.planet of
        Mercury ->
            model.weightOnEarth * 0.286

        Venus ->
            model.weightOnEarth * 0.908

        Earth ->
            model.weightOnEarth

        Mars ->
            model.weightOnEarth * 0.378

        Jupiter ->
            model.weightOnEarth * 2.337

        Saturn ->
            model.weightOnEarth * 0.928

        Uranus ->
            model.weightOnEarth * 0.796

        Neptune ->
            model.weightOnEarth * 1.122


{-| Converts the planet type to an equivalent string
-}
planetToString : Planet -> String
planetToString planet =
    case planet of
        Mercury ->
            "Mercury"

        Venus ->
            "Venus"

        Earth ->
            "Earth"

        Mars ->
            "Mars"

        Jupiter ->
            "Jupiter"

        Saturn ->
            "Saturn"

        Uranus ->
            "Uranus"

        Neptune ->
            "Neptune"
