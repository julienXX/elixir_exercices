defmodule Debug  do
  def value(val) when is_integer(val), do: "integer: #{val}"
  def value(val) when is_atom(val),    do: "atom: #{val}"
  def value(val) when is_list(val),    do: "list: #{inspect val}"
  def value(val), do: "#{val}"
end