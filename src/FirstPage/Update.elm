module FirstPage.Update exposing (..)

import FirstPage.Model exposing (Model, Msg(..))
import Global exposing (GlobalModel)


update : GlobalModel -> Model -> Msg -> ( GlobalModel, Model, Cmd Msg )
update global model msg =
    case msg of
        UpdateGlobalCount i ->
            ( { global | count = i }, model, Cmd.none )
