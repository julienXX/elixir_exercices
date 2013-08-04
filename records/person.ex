defrecord Person, name: "", age: 0 do
  def say_hello(greeting, record) do
    IO.puts "#{greeting}, #{record.name}"
  end
end

m = Person.new name: "Methuselah", age: 969

m.say_hello "You look good for your age"
    