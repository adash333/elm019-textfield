module Main exposing (Model, Msg(..), init, main, update, view)

import Browser
import Html exposing (Attribute, Html, br, div, h1, img, input, p, text)
import Html.Attributes exposing (class, placeholder, src, value)
import Html.Events exposing (onInput)



---- MODEL ----


type alias Model =
    { content : String }


init : ( Model, Cmd Msg )
init =
    ( { content = "" }, Cmd.none )



---- UPDATE ----


type Msg
    = Change String


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Change newContent ->
            ( { model | content = newContent }, Cmd.none )



---- VIEW ----


view : Model -> Html Msg
view model =
    div [ class "section" ]
        [ h1 [] [ text "Elm bulma TextFields" ]
        , img [ src "/logo.svg" ] []
        , br [] []
        , div [ class "columns is-mobile" ]
            [ div [ class "column is-half is-offset-one-quarter" ]
                [ div [ class "field" ]
                    [ div [ class "control" ]
                        [ input [ class "input is-primary", placeholder "Text to reverse", value model.content, onInput Change ] []
                        ]
                    ]
                ]
            ]
        , div [ class "columns is-mobile" ]
            [ div [ class "column is-half is-offset-one-quarter" ]
                [ div [ class "notification is-info has-text-centered" ] [ text (String.reverse model.content) ]
                ]
            ]
        ]



---- PROGRAM ----


main : Program () Model Msg
main =
    Browser.element
        { view = view
        , init = \_ -> init
        , update = update
        , subscriptions = always Sub.none
        }
