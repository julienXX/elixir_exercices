defmodule My do
  defmacro macro(code) do
    IO.inspect code
    quote do
      IO.puts(unquote(code))
    end
  end
end

defmodule Test do
  require My

  My.macro(1 + 2)
end
