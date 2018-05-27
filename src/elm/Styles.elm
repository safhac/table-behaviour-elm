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
        , ( "color", "#3c5966" )
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
    style
        [ ( "text-shadow", "white 0px 1px 0px" )
        , ( "border", "1px solid rgba(255, 255, 255, 0.6)" )
        , ( "color", "rgba(0, 0, 0, 0.6)" )
        ]


created : Attribute msg
created =
    style []


displayed : Attribute msg
displayed =
    style [ ( "box-shadow", "0 1px 1px 0 rgba(0,0,0,0.2),0 1px 1px 0 rgba(0,0,0,0.19)" ) ]


hidden : Attribute msg
hidden =
    style
        [ ( "background-color", "#fefefe" )
        , ( "opacity", "0.4" )
        , ( "color", "transparent" )
        , ( "text-shadow", "0 0 1px #000 " )
        ]
