defexception KinectProtocolError, 
               message: "Kinect protocol error", 
               can_retry: false 
do
  def full_message(me) do
    "Kinect failed: #{me.message}, retriable: #{me.can_retry}"
  end
end

defmodule B do

  def talk_to_kinect, do: raise KinectProtocolError, message: "usb unplugged", can_retry: true
  def schedule_retry,  do: IO.puts "Retrying in 10 seconds"

  def start do
    try do
      talk_to_kinect
    rescue
      error in [KinectProtocolError] ->
        IO.puts error.full_message
        if error.can_retry, do: schedule_retry
    end
  end
end

