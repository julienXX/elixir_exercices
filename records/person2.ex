defrecord Person, name: "", age: 0 

defmodule Friendly do
  def say_hello(record, greeting) do
    IO.puts "#{greeting}, #{record.name}"
  end
end

m = Person.new name: "Methuselah", age: 969

Friendly.say_hello m, "You look good for your age"
    