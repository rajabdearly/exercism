defmodule LineUp do
  @doc """
  Formats a full ticket sentence for the given name and number, including
  the person's name, the ordinal form of the number, and fixed descriptive text.
  """
  @spec format(name :: String.t(), number :: pos_integer()) :: String.t()
  def format(name, number) do
    "#{name}, you are the #{format_number(number)} customer we serve today. Thank you!"
  end

  defp format_number(n) when rem(n, 100) in 11..13, do: "#{n}th"
  defp format_number(n) when rem(n, 10) == 1, do: "#{n}st"
  defp format_number(n) when rem(n, 10) == 2, do: "#{n}nd"
  defp format_number(n) when rem(n, 10) == 3, do: "#{n}rd"
  defp format_number(n), do: "#{n}th"
end
