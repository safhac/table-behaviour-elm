module TableView exposing (renderNoteRow)

import Html exposing (Html, a, div, td, text, tr)
import Html.Attributes exposing (class)
import NoteList exposing (..)


renderNoteRow : Note a -> Html msg
renderNoteRow (Note { body, created } state) =
    let
        noteStyle =
            case state of
                Selected ->
                    "Selected"

                Edited ->
                    "Edited"

                Deleted ->
                    "Deleted"

                Created ->
                    "Created"

                Displayed ->
                    "Displayed"

                Hidden ->
                    "Hidden"
    in
    tr [ class noteStyle ]
        [ td []
            [ text body ]
        , td []
            [ text "created"
            ]
        ]
