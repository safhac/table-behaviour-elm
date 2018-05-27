module NoteList exposing (..)

-- Msg


type Msg
    = NoOp
    | FilterMsg FilterSort
    | NoteMsg NoteState



-- Note
-- type Note
--     = Note NoteBody NoteState


type NoteState
    = Selected
    | Edited
    | Deleted
    | Created
    | Displayed
    | Hidden


type alias Note =
    { body : String
    , createdDate : Float
    , state : NoteState
    }



-- Note List


type SortedList
    = SortedList NoteList FilterSort


type alias NoteList =
    List Note


type FilterSort
    = FilterList String
    | SortList SortListBy


type SortListBy
    = CreationDate SortDirection
    | Alphabetically SortDirection


type SortDirection
    = Asc
    | Desc



-- Helpers


createNote : String -> NoteState -> Note
createNote text state =
    { body = text
    , createdDate = 0
    , state = state
    }


asList : SortedList -> List Note
asList (SortedList list state) =
    case state of
        SortList (Alphabetically Desc) ->
            list
                |> List.sortBy .body

        SortList (Alphabetically Asc) ->
            list
                |> List.sortBy .body
                |> List.reverse

        SortList (CreationDate Desc) ->
            list
                |> List.sortBy .createdDate

        SortList (CreationDate Asc) ->
            list
                |> List.sortBy .createdDate
                |> List.reverse

        _ ->
            list
                |> List.sortBy .createdDate
