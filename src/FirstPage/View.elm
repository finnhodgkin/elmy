module FirstPage.View exposing (..)

import FirstPage.Model exposing (Model, Msg(..))
import Global exposing (GlobalModel)
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)


view : GlobalModel -> Model -> Html Msg
view global model =
    div []
        [ text <| "The count is " ++ String.fromInt global.count
        , button [ onClick <| UpdateGlobalCount 500 ] [ text "Change the global count to 500" ]
        ]
