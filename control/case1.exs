defrecord Person, name: "", state: nil, likes: "nothing" do
  def as_string(record) do
    "#{record.name} lives in #{record.state} and likes #{record.likes}"
  end
end

defmodule Users do 
  dave = Person.new name: "Dave", state: "TX", likes: "programming"
  
  case dave do
    
    Person[state: "TX"] = record ->
      IO.puts Person.as_string record
    
    _ ->
      IO.puts "No matches"

  end
end