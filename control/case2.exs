defrecord Person, name: "", age: 0

defmodule Bouncer do

  dave = Person.new name: "Dave", age: 27

  case dave do
    
    record = Person[age: age] when is_number(age) and age >= 21 ->
      IO.puts "You are cleared to enter the Foo Bar, #{record.name}"
    
    _ ->
      IO.puts "Sorry, no admission"

  end
end
