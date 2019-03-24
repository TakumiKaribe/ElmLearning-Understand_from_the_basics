module Main exposing (main)

import Browser
import Html exposing (..)
import Task
import Time


-- Main

main : Program () Model Msg
main =
    Browser.element
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }


-- MODEL

type alias Model
    = String

init : () -> ( Model, Cmd Msg )
init _ = ( "", Cmd.none )


-- UPDATE

type Msg
    = Hoge
    | Fuga

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Hoge ->
            ( model, Cmd.none )

        Fuga ->
            ( model, Cmd.none )


-- SUBSCRIPTIONS

subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


-- VIEW

view : Model -> Html Msg
view model =
    div [] []
