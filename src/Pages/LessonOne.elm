module Pages.LessonOne exposing (view)

import Colours
import Css
import Css.Media
import Html.Styled as Html exposing (..)
import Html.Styled.Attributes exposing (alt, class, css, href, src)
import ImagePaths exposing (ImagePaths)


type alias Pie =
    { title : String
    , description : String
    , image : ImagePaths -> String
    , link : String
    }


boston : Pie
boston =
    { title = "Boston Cream Pie"
    , description = "Boston's famous dessert, a combination of yellow cake, vanilla pudding, and chocolate frosting."
    , image = .bostonCream
    , link = "http://www.foodnetwork.com/recipes/boston-cream-pie-recipe0-1908702"
    }


keyLime : Pie
keyLime =
    { title = "Key Lime Pie"
    , description = "Key lime pie is based on the tiny key limes from Florida. These limes are less sour than conventional limes."
    , image = .keylimePie
    , link = "https://www.epicurious.com/recipes/food/views/key-lime-pie-108125"
    }


pumpkin : Pie
pumpkin =
    { title = "Pumpkin Pie"
    , description = "A staple of every Thanksgiving dinner table, pumpkin pie is delicious any time of year."
    , image = .pumpkinPie
    , link = "http://www.kingarthurflour.com/recipes/pumpkin-pie-recipe"
    }


coconut : Pie
coconut =
    { title = "Coconut Cream Pie"
    , description = "Coconut cream pie will take you to an island escape. Especially delicious in winter."
    , image = .coconutCream
    , link = "https://www.favfamilyrecipes.com/coconut-cream-pie-2/"
    }


viewPie : ImagePaths -> List (Attribute msg) -> Pie -> Html msg
viewPie imagePaths attrs { title, description, image, link } =
    article
        ([] ++ attrs)
        [ h3 []
            [ text title ]
        , img
            [ css
                [ Css.width (Css.pct 100)
                , Css.maxWidth (Css.px 250)
                ]
            , alt title
            , src (image imagePaths)
            ]
            []
        , p []
            [ text description ]
        , p []
            [ a
                [ css
                    [ Css.color (Css.hex "2772b0")
                    ]
                , href link
                ]
                [ text "Read more >>" ]
            ]
        ]


row : ImagePaths -> List ( Pie, List (Attribute msg) ) -> Html msg
row imagePaths ps =
    let
        showPie ( pie, attrs ) =
            viewPie imagePaths attrs pie
    in
    div
        [ css
            [ Css.after
                [ Css.property "content" "\"\""
                , Css.display Css.table
                , Css.property "clear" "both"
                ]
            ]
        ]
        (List.map showPie ps)


view : { r | imagePaths : ImagePaths } -> Html msg
view { imagePaths } =
    div
        [ css
            [ Css.width (Css.pct 97)
            , Css.maxWidth (Css.px 1200)
            , Css.margin2 Css.zero Css.auto
            , Css.property "float" "none"
            , Css.backgroundColor (Css.hex "fff")
            ]
        ]
        [ row imagePaths
            [ ( boston, firstRow )
            , ( coconut, firstRow )
            , ( keyLime, firstRow )
            , ( pumpkin, firstRow )
            ]
        , row imagePaths
            [ ( keyLime, secondRow )
            , ( pumpkin, secondRow )
            ]
        , row imagePaths
            [ ( boston, startThirdRow )
            , ( coconut, endThirdRow )
            ]
        , row imagePaths
            [ ( boston, fourthRow )
            ]
        ]


endThirdRow : List (Attribute msg)
endThirdRow =
    [ css
        [ Css.backgroundColor Colours.blue
        , stackOnMobile
        , stackOnTablet
        , Css.Media.withMedia [ Css.Media.only Css.Media.screen [ Css.Media.minWidth (Css.px 768) ] ]
            [ Css.marginRight Css.zero
            , Css.float Css.left
            , Css.width (Css.pct 68)
            ]
        ]
    ]


startThirdRow : List (Attribute msg)
startThirdRow =
    [ css
        [ Css.backgroundColor Colours.yellow
        , stackOnMobile
        , stackOnTablet
        , Css.Media.withMedia [ Css.Media.only Css.Media.screen [ Css.Media.minWidth (Css.px 768) ] ]
            [ Css.marginRight Css.zero
            , Css.float Css.left
            , Css.width (Css.pct 20)
            ]
        ]
    ]


fourthRow : List (Attribute msg)
fourthRow =
    [ css
        [ Css.backgroundColor Colours.purple
        , stackOnMobile
        ]
    ]


secondRow : List (Attribute msg)
secondRow =
    [ css
        [ Css.backgroundColor Colours.pink
        , stackOnMobile
        , Css.Media.withMedia [ Css.Media.only Css.Media.screen [ Css.Media.minWidth (Css.px 480) ] ]
            [ Css.marginRight Css.zero
            , Css.float Css.left
            , Css.width (Css.pct 44)
            ]
        ]
    ]


firstRow : List (Attribute msg)
firstRow =
    [ css
        [ Css.backgroundColor Colours.yellow
        , stackOnMobile
        , Css.Media.withMedia [ Css.Media.only Css.Media.screen [ Css.Media.minWidth (Css.px 480), Css.Media.maxWidth (Css.px 767) ] ]
            [ Css.marginRight Css.zero
            , Css.float Css.left
            , Css.width (Css.pct 44)
            ]
        , Css.Media.withMedia [ Css.Media.only Css.Media.screen [ Css.Media.minWidth (Css.px 768) ] ]
            [ Css.marginRight Css.zero
            , Css.float Css.left
            , Css.width (Css.pct 20)
            ]
        ]
    ]


stackOnMobile : Css.Style
stackOnMobile =
    Css.batch
        [ Css.width (Css.pct 92)
        , Css.marginLeft (Css.pct 4)
        , Css.marginRight (Css.pct 4)
        , Css.minHeight (Css.px 1)
        ]


stackOnTablet : Css.Style
stackOnTablet =
    Css.batch
        [ Css.Media.withMedia [ Css.Media.only Css.Media.screen [ Css.Media.minWidth (Css.px 480), Css.Media.maxWidth (Css.px 767) ] ]
            [ Css.marginRight Css.zero
            , Css.minHeight (Css.px 1)
            , Css.float Css.left
            , Css.width (Css.pct 92)
            ]
        ]
