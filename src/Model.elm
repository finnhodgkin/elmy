module Model exposing (..)

import FirstPage.Model as FirstPage
import Global exposing (GlobalModel)
import SecondPage.Model as SecondPage


type alias Model =
    { global : GlobalState, page : Page }


type Page
    = FirstPage FirstPage.Model
    | SecondPage SecondPage.Model


type alias SecondPageModel =
    { title : String }


type alias GlobalState =
    { count : Int }


initialModel : Model
initialModel =
    { global = { count = 0 }, page = FirstPage { title = "Hi" } }
