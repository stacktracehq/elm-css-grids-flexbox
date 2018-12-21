module Pages.LessonTwo exposing (view)

import Css
import Html.Styled as Html exposing (..)
import Html.Styled.Attributes exposing (class, css)


view : model -> Html msg
view _ =
    ul
        [ css
            [ Css.listStyleType Css.none
            , Css.padding Css.zero
            , Css.margin Css.zero
            , Css.border3 (Css.px 1) Css.dotted (Css.hex "F00")
            , Css.displayFlex
            , Css.flexFlow2 Css.row Css.wrap
            ]
        ]
        [ listItem [ class "flex1" ]
            [ text "1 Lorem ipsum dolor sit amet." ]
        , listItem [ class "flex1" ]
            [ text "2 Illum facere saepe nam praesentium." ]
        , listItem [ class "flex2" ]
            [ text "3 Vero quia possimus unde sint!" ]
        , listItem [ class "flex1" ]
            [ text "4 Cupiditate, ab molestias aliquam cum." ]
        , listItem [ class "flex2" ]
            [ text "5 Recusandae inventore distinctio reiciendis id." ]
        , listItem [ class "flex1" ]
            [ text "6 Laboriosam iure saepe distinctio, sunt." ]
        ]


listItem : List (Attribute msg) -> List (Html msg) -> Html msg
listItem attrs children =
    li
        ([ css
            [ Css.border3 (Css.px 1) Css.solid (Css.hex "999")
            , Css.margin (Css.em 0.5)
            , Css.padding (Css.em 0.5)
            ]
         ]
            ++ attrs
        )
        children
