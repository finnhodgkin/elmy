module FirstPage.Model exposing (..)


type alias Model =
    { title : String }


type Msg
    = UpdateGlobalCount Int
