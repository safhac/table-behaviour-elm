module Styles exposing (..)

import Html exposing (Attribute)
import Html.Attributes exposing (class, id, style)


standardContainerStyle : Attribute msg
standardContainerStyle =
    style
        [ ( "display", "flex" )
        , ( "text-align", "center" )
        , ( "flex", "1" )
        , ( "flex-direction", "column" )
        , ( "font-family", "sans-serif" )
        ]


tableStyle : Attribute msg
tableStyle =
    style
        [ ( "background-color", "lightgray" )
        , ( "border-radius", "3px" )
        , ( "margin", "auto" )
        , ( "width", "50vw" )
        ]


rowStyle : Attribute msg
rowStyle =
    style
        [ ( "line-height", "30px" )
        ]


selected : Attribute msg
selected =
    style
        [ ( "background-color", "#fefefe" )
        , ( "border", "1px solid #888" )
        , ( "box-shadow", "0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19)" )
        ]


edited : Attribute msg
edited =
    style []


deleted : Attribute msg
deleted =
    style []


created : Attribute msg
created =
    style []


displayed : Attribute msg
displayed =
    style []


hidden : Attribute msg
hidden =
    style []
