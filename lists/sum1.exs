defmodule MyList do
  def sum([], total // 0)              do total end
  def sum([ head | tail ], total // 0) do sum(tail, head+total) end
end

