module SecondPage.View exposing (..)

import Global exposing (GlobalModel)
import Html exposing (Html, div)
import SecondPage.Model exposing (Model, Msg(..))


view : GlobalModel -> Model -> Html Msg
view global model =
    div [] []
