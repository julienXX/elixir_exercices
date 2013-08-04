defmodule Functions do
  use Behaviour

  defcallback fun1(t :: tuple()) :: 10..20

end

defmodule Client do

  @behaviour Functions

end

