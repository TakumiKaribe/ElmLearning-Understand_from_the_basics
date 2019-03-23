import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import List

main : Program () Model Msg
main =
    Browser.sandbox
        { init = init
        , update = update
        , view = view
        }



-- MODEL

type alias Model =
    { input : String
    , memos : List (Int, String)
    }

init : Model
init =
    { input = ""
    , memos = []
    }


-- UPDATE

type Msg
    = Input String
    | Submit
    | Delete Int

update : Msg -> Model -> Model
update msg model =
    case msg of
        Input input ->
            -- 入力文字列を更新する
            { model | input = input }

        Submit ->
            { model
                -- 入力文字列をリセットする
                | input = ""
                -- 最新のメモを追加する
                , memos = (List.length model.memos, model.input) :: model.memos
            }

        Delete target ->
            { model
            | memos = List.filter (\(index, memo) -> index /= target) model.memos
            }



-- VIEW

view : Model -> Html Msg
view model =
    div []
        [ Html.form [ onSubmit Submit ]
            [ input [ value model.input, onInput Input ] []
            , button
                [ disabled (String.length model.input < 1) ]
                [ text "Submit" ]
            ]
        , ul [] (List.map viewMemo model.memos)
        ]

viewMemo : (Int, String) -> Html Msg
viewMemo (index, memo) =
    div []
        [ li [] [ text memo ]
        , button
            [ onClick (Delete index)]
            [ text "×" ]
        ]
