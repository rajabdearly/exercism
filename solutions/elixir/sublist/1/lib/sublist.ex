defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare([], []) do
    :equal
  end

  def compare(_, []) do
    :superlist
  end

  def compare([], _) do
    :sublist
  end

  def compare(a, b) do
    cond do
      length(a) == length(b) and starts_with?(a, b) -> :equal
      is_sublist_of?(a, b) -> :sublist
      is_sublist_of?(b, a) -> :superlist
      true -> :unequal
    end
  end

  defp is_sublist_of?(small, large) do
    if starts_with?(small, large) do
      true
    else
      if length(small) <= length(large) do
        is_sublist_of?(small, tl(large))
      else
        false
      end
    end
  end

  defp starts_with?([], _), do: true
  defp starts_with?(_, []), do: false
  defp(starts_with?([h | t1], [h | t2]), do: starts_with?(t1, t2))
  defp starts_with?(_, _), do: false
end
