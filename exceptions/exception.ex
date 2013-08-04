defmodule Boom do
  
  def start(n) do
    try do
      raise_error(n)
    rescue
      [ FunctionClauseError, RuntimeError ] ->
        IO.puts "no function match or runtime error"
      error in [ArithmeticError]  ->
        IO.puts "Uh, oh! Arithmetic error: #{error.message}"
        raise error, [ message: "too late, we're doomed"], System.stacktrace
      other_errors ->
        IO.puts "Disaster! #{other_errors.message}"
    after
        IO.puts "DONE!"
    end
  end

  defp raise_error(0) do
    IO.puts "No error"
  end

  defp raise_error(1) do                 
    IO.puts "About to divide by zero"
    1 / 0
  end

  defp raise_error(2) do
    IO.puts "About to call a function that doesn't exist"
    raise_error(99)
  end

  defp raise_error(3) do                 
    IO.puts "About to try creating a directory with no permission"
    File.mkdir!("/not_allowed")
  end
end
