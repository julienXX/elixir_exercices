defmodule FizzBuzz do

  def upto(n) when n > 0, do: _downto(n, [])

  defp _downto(0, result),  do: result

  defp _downto(current, result) do
    next_answer =    
      cond do
        rem(current, 3) == 0 and rem(current, 5) == 0 -> 
          "FizzBuzz"
        rem(current, 3) == 0 ->
          "Fizz"
        rem(current, 5) == 0 -> 
          "Buzz"
        true ->
          current
      end
    _downto(current-1, [ next_answer | result ])
  end
end