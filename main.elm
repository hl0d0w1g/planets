module Main exposing(..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import String

main =
    Html.beginnerProgram {model=model, update=update, view=view}


--model

type alias User =  --Type que contiene los datos del usuario que esta usando la aplicacion
    { name : String
    , namePlanet : String
    , weight : Float
    , weightPlanet : Float
    , planet : String
    , result : String
    }
    

model : User
model =  --Se inicializa el modelo de tipo User
    { name = ""
    , namePlanet = ""
    , weight = 0.0
    , weightPlanet = 0.0
    , planet = ""
    , result = "none"
    }


--update

type Msg  --Tipos de mensajes que se pueden generar en el HTML
    = Weight String 
    | Name String
    | Planet String 
    | Calc

update : Msg -> User -> User
update msg user = --En funcion del tipo de mensaje que llega se llaman a unas funciones u otras
    case msg of
        Weight text ->
            {user | weight = Result.withDefault 0 (String.toFloat text)} --Se establece un valor por defecto para el Result de la operacion toFloat
        Name text ->
            {user | name = text}
        Planet text -> 
            { user | planet = text}
        Calc ->
            { user | result = "block" --Hace visible los resultados
            , namePlanet = calcName user
            , weightPlanet = calcWeight user}

             
calcWeight : User -> Float
calcWeight user = --Calculo del peso en funcion de la gravedad de cada planeta
    case user.planet of
        "Mercurio" ->
            user.weight * 0.286 --coef = gravedad planeta / gravedad tierra
        "Venus" ->
            user.weight * 0.908
        "Marte" ->
            user.weight * 0.378
        "Jupiter" ->
            user.weight * 2.337
        "Saturno" ->
            user.weight * 0.928
        "Urano" ->
            user.weight * 0.796
        "Neptuno" ->
            user.weight * 1.122 
        _ -> --deault
            user.weight 
            

calcName : User -> String
calcName user = --El nombre en cada planeta solo es un producto de una modificacion simple sobre el string name
    case user.planet of
        "Mercurio" ->
            String.dropRight 2 user.name
        "Venus" ->
            String.reverse user.name
        "Marte" ->
            String.right 2 user.name
        "Jupiter" ->
            String.toUpper user.name
        "Saturno" ->
            String.left 2 user.name
        "Urano" ->
            String.append user.name "ito"
        "Neptuno" ->
            String.dropLeft 2 user.name  
        _ -> --default
            user.name
              
--view

view : User -> Html Msg
view user =
    div[][
        div [style [("text-align", "center")], class "jumbotron"]
            [ stylesheet
            , h1 [] [text "Calcula tus datos en otro planeta"]
            , h2 [] [text """
                    Introduce tu nombre y tu peso en la tierra y podrás conocer como
                    serían en otro planeta del sistema solar
                    """]
            , div [style[("padding", "10px")]] 
            [ input [placeholder "Introduce tu nombre", onInput Name, fieldStyle] []
            , input [placeholder "Introduce tu peso", onInput Weight, fieldStyle] []
            ] 
            , h3 [] [text ("Elige un planeta")] 
            , div [style[("padding", "10px"), ("font-size", "20px")]] 
            [ btnRad "Mercurio" (Planet "Mercurio")
            , btnRad "Venus" (Planet "Venus")
            , btnRad "Marte" (Planet "Marte")
            , btnRad "Jupiter" (Planet "Jupiter")
            , btnRad "Saturno" (Planet "Saturno")
            , btnRad "Urano" (Planet "Urano")
            , btnRad "Neptuno" (Planet "Neptuno")
            ]
            , div [style[("padding", "10px"), ("font-size", "20px")]] 
            [ button [onClick (Calc), btnStyle] [text "Calcular"]] 
        ]
        , h3 [style[("display", user.result), ("text-align", "center")]] 
        [text ("Tu nombre en el idioma local sería " ++ user.namePlanet
        ++ " y tendrías un peso de " ++ toString user.weightPlanet ++ " N.")]
    ]

btnRad : String -> Msg -> Html Msg
btnRad value msg = --Funcion de los radio buttons
  label
    [ style [("padding", "20px")]
    ]
    [ input [ type_ "radio", name "font-size", onClick msg ] []
    , text value
    ]


stylesheet = --Hoja de estilos para introducir Bootstrap
    let
        tag =
            "link"

        attrs =
            [ attribute "Rel" "stylesheet"
            , attribute "property" "stylesheet"
            , attribute "href" "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
            ]

        children =
            []
    in
        node tag attrs children

btnStyle = --Estilo de los botones
  style
    [ ("margin", "5px")
    , ("padding", "10px")
    , ("text-align", "center")
    ]

fieldStyle = --Estilo de los campos introduccion de texto
    style
    [ ("width", "30%")
    , ("height", "40px")
    , ("margin", "10px")
    , ("font-size", "30px")
    , ("text-align", "center")
    ]