module Main exposing (..)

import Html exposing (Html, div, text)


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }



-- TYPES


type alias Model =
    { message : String
    }


type Msg
    = NoOp



-- MODEL


init : ( Model, Cmd Msg )
init =
    ( { message = "Elm program is ready. Get started!" }, Cmd.none )



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )



-- VIEW


view : Model -> Html Msg
view model =
    div [] [ text model.message ]



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
