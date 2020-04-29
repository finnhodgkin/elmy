module Main exposing (..)

import Browser
import FirstPage.Model as FirstPageModel
import FirstPage.Update as FirstPageUpdate
import FirstPage.View as FirstPageView
import Html exposing (Html, div)
import Model exposing (Model, Page(..), initialModel)
import SecondPage.Model as SecondPageModel
import SecondPage.Update as SecondPageUpdate



-- MAIN


main : Program () Model Msg
main =
    Browser.element
        { init = always ( initialModel, Cmd.none )
        , update = update
        , subscriptions = subscriptions
        , view = view
        }



-- MODEL


type Msg
    = FirstPageMsgs FirstPageModel.Msg
    | SecondPageMsgs SecondPageModel.Msg



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case ( msg, model.page ) of
        ( FirstPageMsgs nestedMsg, FirstPage m ) ->
            let
                ( global, pageModel, cmd ) =
                    FirstPageUpdate.update model.global m nestedMsg
            in
            ( { model | global = global, page = FirstPage pageModel }, Cmd.map FirstPageMsgs cmd )

        ( SecondPageMsgs nestedMsg, SecondPage m ) ->
            let
                ( global, pageModel, cmd ) =
                    SecondPageUpdate.update model.global m nestedMsg
            in
            ( { model | global = global, page = SecondPage pageModel }, Cmd.map SecondPageMsgs cmd )

        ( _, _ ) ->
            -- ignore msgs for incorrect pages
            ( model, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- VIEW


view : Model -> Html Msg
view { global, page } =
    case page of
        FirstPage firstPageModel ->
            Html.map FirstPageMsgs <| FirstPageView.view global firstPageModel

        SecondPage secondPageModel ->
            div [] []
