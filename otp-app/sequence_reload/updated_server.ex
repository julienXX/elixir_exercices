defmodule Sequence.Server do
  use GenServer.Behaviour
  @vsn "1"

  # The state representation has been changed to a tuple throughout the module

  def start_link(initial) do
    :gen_server.start_link({ :local, :sequence }, __MODULE__, initial, [])
  end

  def next_number do
    :gen_server.call :sequence, :next_number
  end

  def increment_number(delta) do
    :gen_server.cast :sequence, {:increment_number, delta}
  end

  def init(initial) when is_number(initial) do
    { :ok, {initial, 1} }
  end

  def handle_call(:next_number, _from, {current_number, delta}) do
    { :reply, current_number, {current_number + delta, delta} }
  end

  def handle_cast({:increment_number, delta}, {current_number, _old_delta}) do
    { :noreply, {current_number + delta, delta}}
  end

  def code_change("0", oldState, _extra) do
    IO.puts "Changing code from 0 to 1"
    { :ok, {oldState, 1} }
  end
end
