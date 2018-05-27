module TableView exposing (renderNoteRow)

import Html exposing (Html, a, div, td, text, tr)
import Html.Attributes exposing (class)
import NoteList exposing (..)
import Styles exposing (..)


renderNoteRow : Note a -> Html msg
renderNoteRow (Note { body, createdDate } state) =
    let
        noteStyle =
            case state of
                Selected ->
                    selected

                Edited ->
                    edited

                Deleted ->
                    deleted

                Created ->
                    created

                Displayed ->
                    displayed

                Hidden ->
                    hidden
    in
    tr [ rowStyle, noteStyle ]
        [ td []
            [ text body ]
        , td []
            [ text "created"
            ]
        ]
