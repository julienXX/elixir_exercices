IO.puts File.open!("/usr/share/dict/words")
        |> IO.stream
        |> Enum.max(&String.length/1)