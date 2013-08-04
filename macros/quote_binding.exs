defmodule My do
  defmacro macro(code) do
    quote bind_quoted: [local_code: code] do
      IO.puts(local_code)
    end
  end
end
