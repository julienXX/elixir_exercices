defprotocol Collection do
  @only [List, Tuple, BitString, Any]
  def is_collection?(value)
end

defimpl Collection, for: [List, Tuple, BitString] do
  def is_collection?(_), do: true
end

defimpl Collection, for: Any do
  def is_collection?(_), do: false
end

Enum.each [ 1, 1.0, [1,2], {1,2}, HashDict.new, "cat" ], fn value ->
  IO.puts "#{inspect value}:  #{Collection.is_collection?(value)}"
end