module NoteList exposing (..)

-- Note


type Note a
    = Note NoteBody NoteState


type NoteState
    = Selected
    | Edited
    | Deleted
    | Created


type alias NoteBody =
    { text : String
    , created : Float
    }



-- Note List


type SortedList a
    = SortedList NoteList FilerSort


type alias NoteList =
    List Note


type FilerSort
    = Filter String
    | Sort SortyBy


type SortyBy
    = CreationDate
    | Alphabetically
