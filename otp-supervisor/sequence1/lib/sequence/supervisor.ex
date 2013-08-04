defmodule Sequence.Supervisor do
  use Supervisor.Behaviour

  def start_link(initial_number) do
    :supervisor.start_link(__MODULE__, initial_number)
  end

  def init(initial_number) do
    child_processes = [ worker(Sequence.Server, [initial_number]) ]
    supervise child_processes, strategy: :one_for_one
  end
end