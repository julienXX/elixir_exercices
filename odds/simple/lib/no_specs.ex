defmodule NoSpecs do

  def length_plus_n(list, n) do
    length(list) + n
  end

  def call_it do
    length_plus_n([:a, :b], :c)
  end
end

