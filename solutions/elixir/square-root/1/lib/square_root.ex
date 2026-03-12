defmodule SquareRoot do
  @doc """
  Calculate the integer square root of a positive integer
  """
  @spec calculate(radicand :: pos_integer) :: pos_integer
  def calculate(radicand) do
    do_search(1, radicand, radicand)
  end

  defp do_search(low, high, radicand) do
    mid = div(low + high, 2)

    case mid * mid do
      sqr when sqr == radicand -> mid
      sqr when sqr > radicand -> do_search(low, mid - 1, radicand)
      sqr when sqr < radicand -> do_search(mid + 1, high, radicand)
    end
  end
end
