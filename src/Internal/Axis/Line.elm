module Internal.Axis.Line exposing (Line, default, fat, rangeFrame, Config, custom, config)


import Svg exposing (Attribute)
import Lines.Color as Color
import Internal.Coordinate as Coordinate


{-| -}
type Line msg =
  Line (Coordinate.Range -> Coordinate.Range -> Config msg)


{-| -}
default : Line msg
default =
  Line <| \_ {min, max} ->
    { color = Color.gray
    , width = 1
    , events = []
    , start = min
    , end = max
    }


{-| -}
fat : Line msg
fat =
  Line <| \_ {min, max} ->
    { color = Color.gray
    , width = 3
    , events = []
    , start = min
    , end = max
    }


{-| -}
rangeFrame : Line msg
rangeFrame =
  Line <| \{min, max} _ ->
    { color = Color.gray
    , width = 1
    , events = []
    , start = min
    , end = max
    }



-- CUSTOM


{-| -}
type alias Config msg =
  { color : Color.Color
  , width : Float
  , events : List (Attribute msg)
  , start : Float
  , end : Float
  }


{-| -}
custom : (Coordinate.Range -> Coordinate.Range -> Config msg) -> Line msg
custom =
  Line



-- INTERNAL


{-| -}
config : Line msg -> Coordinate.Range -> Coordinate.Range -> Config msg
config (Line config) =
  config
