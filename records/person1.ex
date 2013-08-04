defrecord Person, name: "", age: 0 do
  def say_hello(record, greeting) do
    IO.puts "#{greeting}, #{record.name}"
  end
end

m = Person.new name: "Methuselah", age: 969

Person.say_hello m, "You look good for your age"
    