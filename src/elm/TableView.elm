module TableView exposing (..)

import Date
import Html exposing (Html, a, div, input, td, text, th, thead, tr)
import Html.Attributes exposing (placeholder, type_)
import Html.Events exposing (onClick, onInput)
import NoteList exposing (..)
import Styles exposing (..)


renderNoteRow : Note -> Html Msg
renderNoteRow { body, createdDate, state } =
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


renderTableHead : ( SortListBy, SortListBy ) -> Html Msg
renderTableHead ( alphaSort, dateSort ) =
    thead []
        [ th
            [ tHeader
            ]
            [ a
                [ alphaSort
                    |> SortList
                    |> FilterMsg
                    |> onClick
                ]
                [ text "Title" ]
            ]
        , th
            [ tHeader
            , searchHeader
            , onInput (FilterList >> FilterMsg)
            ]
            [ a
                [ dateSort
                    |> SortList
                    |> FilterMsg
                    |> onClick
                ]
                [ text "Created" ]
            , input [ placeholder "  Search..." ] []
            ]
        ]


formatTimestamp : Float -> String
formatTimestamp timestamp =
    toString (Date.fromTime timestamp)
        |> String.slice 1 -16
