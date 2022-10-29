defmodule Hello do

    def world do
        IO.puts "Hello world"
    end

    def your_name(name) do
        "Hello, " <> name
    end
end

Hello.world
"elixir" |> Hello.your_name |> IO.puts
