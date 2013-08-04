defmodule Fibonacci do

  def of(n), do: _fib(n, 0, 1)

  def _fib(0, result, _next), do: result
  def _fib(n, result, next),  do: _fib(n-1, next, result+next)

end