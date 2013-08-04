defmodule Tracer do
  
  def args(arg_list) do
    (lc arg inlist arg_list, do: (inspect(arg))) |> Enum.join(", ")
  end

  def function_definition(name, arg_list) do
    "#{name}(#{args(arg_list)})"
  end

  def call_seq(name, args) do
    function_definition(name, args)
  end

  def log(prefix, msg, param) do
    IO.ANSI.escape("%{cyan}#{prefix} %{green}#{msg} %{yellow}#{param}") |> IO.puts
  end

  defmacro def(definition = {name, _meta, args}, do: contents) do
    quote do
      Kernel.def unquote(definition) do
        Tracer.log "==>", "call   ", Tracer.call_seq(unquote(name), unquote(args))
        result = unquote(contents)
        Tracer.log "<==", "returns", inspect(result)
        result
      end
    end
  end

  defmacro __using__(_opts) do
    quote do
      require unquote(__MODULE__)
      import Kernel, except: [def: 2]
      import unquote(__MODULE__), only: [def: 2]
    end
  end

end

defmodule Test do
  use Tracer
  def puts_sum_three(a,b,c), do: IO.puts(a+b+c)
  def add_list(list),        do: Enum.reduce(list, 0, &(&1+&2))
end

Test.puts_sum_three(1,2,3)
Test.add_list([5,6,7,8])
