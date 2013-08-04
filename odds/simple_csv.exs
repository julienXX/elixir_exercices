defmodule SimpleCsv do

  def sigil_s(lines, options) do
    separator = cond do
      ?c in options -> ","
      ?t in options -> "\t"
      true          -> ","
    end

    lines 
    |> String.rstrip 
    |> String.split("\n")
    |> Enum.map(&String.split(&1, separator))
  end

end

defmodule Example do
  import SimpleCsv

  def comma do
    %s"""
    1,2,cat
    4,5,6,7
    linus,lucy
    """
  end

  # def tab do
  #   %s"""
  #   1\t2\tcat
  #   4\t5\t6\t7
  #   linus\tlucy
  #   """t
  # end

end

IO.inspect Example.comma
IO.inspect Example.tab
