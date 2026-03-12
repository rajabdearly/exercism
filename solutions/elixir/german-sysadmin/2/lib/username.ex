defmodule Username do
  def sanitize([]), do: ~c""

  def sanitize([head | tail]) do
    # ä becomes ae
    # ö becomes oe
    # ü becomes ue
    # ß becomes ss

    case head do
      head when head >= 97 and head <= 122 -> [head] ++ sanitize(tail)
      ?_ -> [head | sanitize(tail)]
      ?ä -> [~c"ae" | sanitize(tail)]
      ?ö -> [~c"oe" | sanitize(tail)]
      ?ü -> [~c"ue" | sanitize(tail)]
      ?ß -> [~c"ss" | sanitize(tail)]
      _ -> sanitize(tail)
    end
  end
end
