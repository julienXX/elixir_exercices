import :timer, only: [ sleep: 1 ]

defmodule Link1 do
  def sad_method do
    sleep 500
    exit(99)
  end

  def run do
    spawn(Link1, :sad_method, [])

    receive do
      msg -> 
        IO.puts "MESSAGE RECEIVED: #{inspect msg}"
    after 1000 ->
        IO.puts "Nothing happened as far as I am concerned"
    end
  end
end

