module Main exposing (..)

import Html exposing (Html, div, table, text)
import NoteList exposing (..)
import Styles exposing (..)
import TableView exposing (renderNoteRow)


main : Program Never (Model a) Msg
main =
    Html.program
        { init = init
        , update = update
        , view = view
        , subscriptions = \_ -> Sub.none
        }



-- Msg


type Msg
    = NoOp



-- Model


type alias Model a =
    { list : SortedList a
    }



-- Init


init : ( Model a, Cmd Msg )
init =
    ( { list = initialNoteList }, Cmd.none )


initialNoteList : SortedList a
initialNoteList =
    SortedList initialList (Alphabetically |> SortList)


initialList : NoteList a
initialList =
    [ initialNote ]


initialNote : Note a
initialNote =
    Note initialNoteBody Displayed


initialNoteBody : NoteBody
initialNoteBody =
    { body = "My first note :)"
    , createdDate = 0
    }



-- UPDATE


update : Msg -> Model a -> ( Model a, Cmd Msg )
update msg model =
    ( model, Cmd.none )



-- VIEW


view : Model a -> Html Msg
view model =
    div [ standardContainerStyle ]
        [ table [ tableStyle ]
            (model.list
                |> asList
                |> List.map
                    renderNoteRow
            )
        ]
