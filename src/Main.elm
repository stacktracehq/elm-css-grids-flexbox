module Main exposing (main)

import Browser exposing (element)
import Html.Styled as Html exposing (Html, toUnstyled)
import ImagePaths exposing (ImagePaths, imagePathsDecoder)
import Json.Decode
import Pages.LessonOne


type alias Model =
    { imagePaths : ImagePaths
    }


type alias Flags =
    { imagePaths : Json.Decode.Value
    }


type Msg
    = None


main : Program Flags Model Msg
main =
    Browser.element
        { init = init
        , subscriptions = subscriptions
        , update = update
        , view = view >> toUnstyled
        }


init : Flags -> ( Model, Cmd Msg )
init flags =
    case Json.Decode.decodeValue imagePathsDecoder flags.imagePaths of
        Ok imagePaths ->
            ( { imagePaths = imagePaths }, Cmd.none )

        Err s ->
            Debug.todo "Handle failed flags"


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none


update : Msg -> Model -> ( Model, Cmd Msg )
update _ model =
    ( model, Cmd.none )


view : Model -> Html Msg
view =
    Pages.LessonOne.view
