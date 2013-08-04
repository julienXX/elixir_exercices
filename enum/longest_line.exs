IO.puts File.read!("/usr/share/dict/words")
        |> String.split
        |> Enum.max(&String.length/1)