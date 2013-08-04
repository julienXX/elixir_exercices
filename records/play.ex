defrecord Play, name: "", age: 0 do
  def say_name(a,b,r) do
    IO.puts a
    IO.puts b
    IO.puts r.name
  end
end
    