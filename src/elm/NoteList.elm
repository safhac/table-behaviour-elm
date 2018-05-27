module NoteList exposing (..)

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
    { text : String
    , created : Float
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
