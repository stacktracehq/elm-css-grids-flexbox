module ImagePaths exposing (ImagePaths, imagePathsDecoder)

import Json.Decode as Decode exposing (Decoder, string)
import Json.Decode.Pipeline exposing (required)


type alias ImagePaths =
    { one : String
    , two : String
    , three : String
    , four : String
    , five : String
    , six : String
    , applePie : String
    , bostonCream : String
    , bostonCreme : String
    , cherryAlamode : String
    , cherryPie : String
    , clouds : String
    , coconutCream : String
    , coconutCreme : String
    , fb5 : String
    , gonePie : String
    , insta4 : String
    , keylimePie : String
    , lemonMeringue : String
    , logo : String
    , merilee : String
    , mincemeat : String
    , miniPies : String
    , mom1200 : String
    , mom300 : String
    , mom767 : String
    , momPie : String
    , peacePie150 : String
    , peacePie500 : String
    , peacePiejpg : String
    , peacePieOriginal : String
    , peachPie : String
    , piDay : String
    , pieCoffee : String
    , pieSliceBuffet : String
    , pin : String
    , pumpkinPie : String
    , scallop : String
    , sitecomp_02 : String
    , tumblr3 : String
    , twitter1 : String
    , wholePieBuffet : String
    }


imagePathsDecoder : Decoder ImagePaths
imagePathsDecoder =
    Decode.succeed ImagePaths
        |> required "one" string
        |> required "two" string
        |> required "three" string
        |> required "four" string
        |> required "five" string
        |> required "six" string
        |> required "applePie" string
        |> required "bostonCream" string
        |> required "bostonCreme" string
        |> required "cherryAlamode" string
        |> required "cherryPie" string
        |> required "clouds" string
        |> required "coconutCream" string
        |> required "coconutCreme" string
        |> required "fb5" string
        |> required "gonePie" string
        |> required "insta4" string
        |> required "keylimePie" string
        |> required "lemonMeringue" string
        |> required "logo" string
        |> required "merilee" string
        |> required "mincemeat" string
        |> required "miniPies" string
        |> required "mom1200" string
        |> required "mom300" string
        |> required "mom767" string
        |> required "momPie" string
        |> required "peacePie150" string
        |> required "peacePie500" string
        |> required "peacePiejpg" string
        |> required "peacePieOriginal" string
        |> required "peachPie" string
        |> required "piDay" string
        |> required "pieCoffee" string
        |> required "pieSliceBuffet" string
        |> required "pin" string
        |> required "pumpkinPie" string
        |> required "scallop" string
        |> required "sitecomp_02" string
        |> required "tumblr3" string
        |> required "twitter1" string
        |> required "wholePieBuffet" string
