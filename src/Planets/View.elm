module Planets.View exposing (view)

{-| This module contains the main view component of the app


# Definition

@docs view

-}

import Planets.Types exposing (Model, Msg(..), Planet(..))
import Planets.Utils exposing (planetToString)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


{-| Main app view element
-}
view : Model -> Html Msg
view model =
    div [ class "container" ]
        [ div [ class "row" ]
            [ div [ class "col" ]
                [ div [ class "row justify-content-center" ]
                    [ div [ class "col-auto" ]
                        [ h1 [] [ text "Calculate your data on another planet" ] ]
                    ]
                , div [ class "row justify-content-center" ]
                    [ div [ class "col-auto text-center" ]
                        [ h5 [] [ text "Enter your name and your weight on the Earth and you can know how they would be on another planet in the solar system" ]
                        ]
                    ]
                , div [ class "row justify-content-center" ]
                    [ div [ class "col-auto" ]
                        [ input
                            [ type_ "text"
                            , placeholder "Introduce your name"
                            , class "form-control"
                            , onInput NameField
                            ]
                            []
                        ]
                    , div [ class "col-auto" ]
                        [ input
                            [ type_ "number"
                            , placeholder "Introduce your weight"
                            , class "form-control"
                            , onInput WeightField
                            ]
                            []
                        ]
                    ]
                , div [ class "row justify-content-center" ]
                    [ div [ class "col-auto" ]
                        [ div [ class "row justify-content-center" ]
                            [ div [ class "col-auto" ]
                                [ h4 [] [ text "Choose a planet" ] ]
                            ]
                        , div [ class "row justify-content-center" ]
                            [ div [ class "col-auto" ]
                                [ renderRadioButton Mercury
                                , renderRadioButton Venus
                                , renderRadioButton Mars
                                , renderRadioButton Jupiter
                                , renderRadioButton Saturn
                                , renderRadioButton Uranus
                                , renderRadioButton Neptune
                                ]
                            ]
                        ]
                    ]
                , div [ class "row justify-content-center" ]
                    [ div [ class "col-auto" ]
                        [ button
                            [ type_ "button"
                            , class "btn btn-primary"
                            , disabled False
                            , onClick Calculate
                            ]
                            [ text "Calculate" ]
                        ]
                    ]
                , if (model.displayResult) then
                    div [ class "row justify-content-center" ]
                        [ div [ class "col-auto text-center" ]
                            [ h6 []
                                [ text
                                    ("Your name in the local language would be "
                                        ++ model.nameOnThePlanet
                                        ++ " and you will have a weight of "
                                        ++ toString model.weightOnThePlanet
                                        ++ " N."
                                    )
                                ]
                            ]
                        ]
                  else
                    div [] []
                ]
            ]
        ]


{-| Renders the buttons of type radio
-}
renderRadioButton : Planet -> Html Msg
renderRadioButton planet =
    div [ class "custom-control custom-radio custom-control-inline" ]
        [ input
            [ type_ "radio"
            , class "custom-control-input"
            , id (planetToString planet)
            , name "radioButtons"
            , onClick (SelectedPlanet planet)
            ]
            []
        , label
            [ class "custom-control-label"
            , for (planetToString planet)
            ]
            [ text (planetToString planet) ]
        ]
