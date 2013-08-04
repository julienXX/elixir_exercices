defmodule Example do

  @attr "one"
  def first, do: @attr
  @attr "two"
  def second, do: @attr

end

IO.puts "#{Example.first}  #{Example.second}"    # => one  two
