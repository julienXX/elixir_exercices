defrecord Bitmap, value: 0

defimpl Access, for: Bitmap do
  use Bitwise
  def access({Bitmap, value}, bit) do
    if (value &&& (1 <<< bit)) == 0, do: 0, else: 1
  end

end

fifty = Bitmap.new value: 50

[5,4,3,2,1,0] |> Enum.each(fn bit -> IO.puts fifty[bit] end)

defimpl Enumerable, for: Bitmap do
  import :math, only: [log: 1]

  def reduce(bitmap, acc, fun) do
    _reduce(bitmap, { count(bitmap), acc}, fun)
  end

  defp _reduce(_bitmap, { -1, acc}, _fun), do: acc
                     
  defp _reduce(bitmap, { bit, acc }, fun) do
    _reduce(bitmap, { bit - 1, fun.(bitmap[bit], acc) }, fun)
  end

  def member?(value, bit_number) do
    value[bit_number]
  end

  def count(Bitmap[value: value]) do              
    trunc(log(abs(value))/log(2)) + 1
  end
end

IO.puts Enum.join fifty, ":"

defimpl Binary.Chars, for: Bitmap do
  def to_binary(value), do: Enum.join(value, "")
end

IO.puts "Fifty in bits is #{fifty}"

defimpl Inspect, for: Bitmap do
  def inspect(bitmap=Bitmap[value: value], opts = Inspect.Opts[]) do
    if opts.raw do
      Inspect.Tuple.inspect(bitmap, opts)
    else
      "#Bitmap[#{value}=#{bitmap}]"
    end
  end
end

IO.inspect fifty
IO.inspect fifty, raw: true

defimpl Inspect, for: Bitmap do
  import Inspect.Algebra
  def inspect(bitmap=Bitmap[value: value], opts = Inspect.Opts[]) do
    if opts.raw do
      Inspect.Tuple.inspect(bitmap, opts)
    else
      concat([
             nest(
                  concat([
                          "#Bitmap[",
                          break(""),
                          nest(
                               concat([
                                       to_binary(value),
                                       "=", 
                                       break(""),
                                       to_binary(bitmap)
                                     ]), 2),
                        ]), 2),
             break(""),
             "]"])
    end
  end
end

big_bitmap = Bitmap.new value: 12345678901234567890

IO.inspect big_bitmap
IO.inspect big_bitmap, raw: true
