defrecord MyList, list: []

defimpl Enumerable, for: MyList do

  def reduce(MyList[list: list], acc, fun), do: _reduce(list, acc, fun)

  def _reduce([h|t], acc, fun) do
    _reduce(t, fun.(h, acc), fun)
  end

  def _reduce([], acc, _fun) do
    acc
  end


  def member?(collection, value) do
    Enum.member?(collection.list, value)
  end

  def count(collection) do
    length(collection.list)
  end

end

my_list = MyList.new list: [1, 2, 3]

IO.puts(Enum.count my_list)
IO.puts(Enum.member? my_list, 3)
Enum.each my_list, IO.puts(&1)
