module NoteList exposing (..)

-- Msg


type Msg
    = NoOp
    | FilterMsg FilterSort
    | NoteMsg NoteState



-- Note


type Note a
    = Note NoteBody NoteState


type NoteState
    = Selected
    | Edited
    | Deleted
    | Created
    | Displayed
    | Hidden


type alias NoteBody =
    { body : String
    , createdDate : Float
    }



-- Note List


type SortedList a
    = SortedList (NoteList a) FilterSort


type alias NoteList a =
    List (Note a)


type FilterSort
    = FilterList String
    | SortList SortListBy
    | UnOrdered


type SortListBy
    = CreationDate
    | Alphabetically



-- Helpers


createNote : String -> NoteBody
createNote text =
    { body = text
    , createdDate = 0
    }


asList : SortedList a -> List (Note a)
asList (SortedList list state) =
    list
