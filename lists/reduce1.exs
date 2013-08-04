defmodule MyList do

  @type element    :: any              
  @type value      :: any
  @type collection :: [ element ]

  @doc """
  Takes a list, an accumulator value, and a function. Applies the function
  to each element of the list in turn, also passing it the current accumulator
  value. The value returned by the function becomes the new accumulator.
  Returns the final value of the accumulator.

  ## Examples

          iex> MyList.reduce([1,2,3,4,5], 0, &(&1 + &2))
          15
          iex> MyList.reduce([1,2,3,4,5], 1, &(&1 * &2))
          120
    
  """
  @spec reduce(collection, value, (element,value -> value)) :: value   
 
  def reduce([head | tail], value, fun) do 
    reduce(tail, fun.(head, value), fun)
  end
  def reduce([], value, _) do
    value 
  end
end

