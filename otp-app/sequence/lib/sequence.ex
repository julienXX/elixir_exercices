defmodule Sequence do

  def start(_type, initial_number) do
    Sequence.Supervisor.start_link(initial_number)
  end

end
