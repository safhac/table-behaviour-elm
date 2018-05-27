module Main exposing (..)

import Html exposing (Html, div, table, text)
import NoteList exposing (..)
import Styles exposing (..)
import TableView exposing (..)


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , update = update
        , view = view
        , subscriptions = \_ -> Sub.none
        }



-- Model


type alias Model =
    { list : SortedList
    }



-- Init


init : ( Model, Cmd Msg )
init =
    ( { list = initialNoteList }, Cmd.none )


initialNoteList : SortedList
initialNoteList =
    SortedList initialList (Alphabetically Desc |> SortList)


initialList : NoteList
initialList =
    [ initialNote
    , createNote
        "Note 2"
        Displayed
    , createNote
        "Deleted note"
        Deleted
    , createNote
        "Selected note"
        Selected
    , createNote
        "Edited note"
        Edited
    , createNote
        "Hidden note"
        Hidden
    , createNote
        ""
        Created
    ]


initialNote : Note
initialNote =
    { body = "My first note :)"
    , createdDate = 0
    , state = Displayed
    }



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        FilterMsg filterSort ->
            case filterSort of
                SortList sortListBy ->
                    case sortListBy of
                        Alphabetically direction ->
                            { list = SortedList initialList (Alphabetically direction |> SortList) } ! []

                        CreationDate direction ->
                            { list = SortedList initialList (CreationDate direction |> SortList) } ! []

                FilterList filter ->
                    { list = SortedList initialList (FilterList filter) } ! []

        _ ->
            model ! []



-- VIEW


view : Model -> Html Msg
view { list } =
    let
        currentSort =
            case list of
                SortedList list sort ->
                    sort

        alphaSort =
            case currentSort of
                SortList (Alphabetically Desc) ->
                    Alphabetically Asc

                _ ->
                    Alphabetically Desc

        dateSort =
            case currentSort of
                SortList (CreationDate Desc) ->
                    CreationDate Asc

                _ ->
                    CreationDate Desc

        header =
            renderTableHead ( alphaSort, dateSort )

        content =
            list
                |> asList
                |> List.map
                    renderNoteRow
    in
    div [ standardContainerStyle ]
        [ table [ tableStyle ]
            (header
                :: content
            )
        ]
