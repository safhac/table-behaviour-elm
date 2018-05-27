module TableView exposing (renderNoteRow)

import Date
import Html exposing (Html, a, div, input, td, text, tr)
import Html.Attributes exposing (placeholder, type_)
import Html.Events exposing (onClick)
import NoteList exposing (..)
import Styles exposing (..)


renderNoteRow : Note a -> Html msg
renderNoteRow (Note { body, createdDate } state) =
    let
        showDate =
            text <| formatTimestamp createdDate

        rowElement =
            case state of
                Selected ->
                    tr [ rowStyle, selected ]
                        [ td []
                            [ text body ]
                        , td []
                            [ showDate
                            ]
                        ]

                Edited ->
                    tr [ rowStyle ]
                        [ td []
                            [ input [ edited, placeholder body ] [] ]
                        , td []
                            [ showDate
                            ]
                        ]

                Deleted ->
                    tr [ rowStyle, deleted ]
                        [ td []
                            [ text body ]
                        , td []
                            [ showDate
                            ]
                        ]

                Created ->
                    tr [ rowStyle ]
                        [ td []
                            [ input [ edited, created, placeholder "Create a new note..." ] []
                            ]
                        , td []
                            []
                        ]

                Displayed ->
                    tr [ rowStyle, displayed ]
                        [ td []
                            [ text body ]
                        , td []
                            [ showDate
                            ]
                        ]

                Hidden ->
                    tr [ rowStyle, hidden ]
                        [ td []
                            [ text body ]
                        , td []
                            [ showDate
                            ]
                        ]
    in
    rowElement


formatTimestamp : Float -> String
formatTimestamp timestamp =
    toString (Date.fromTime timestamp)
        |> String.slice 1 -16
