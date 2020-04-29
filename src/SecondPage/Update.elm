module SecondPage.Update exposing (..)

import Global exposing (GlobalModel)
import SecondPage.Model exposing (Model, Msg(..))


update : GlobalModel -> Model -> Msg -> ( GlobalModel, Model, Cmd Msg )
update global model msg =
    case msg of
        NoOp ->
            ( global, model, Cmd.none )
