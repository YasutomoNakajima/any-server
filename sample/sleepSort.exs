#! /usr/bin/env elixir

defmodule SleepSort do
    def run(parent_pid, arr) do
        parent = self()
        pids = Enum.map( arr, fn(n) ->
        spawn fn ->
            :timer.sleep n * 1000
            send parent, n
        end
        end)

        result = Enum.map( pids, fn(_) ->
        receive do
            n -> n
        end
        end)

        send parent_pid, {:sort_ok, result}
    end
end

arr = Enum.shuffle(1..10)

IO.puts "target is ..."
IO.inspect arr

parent_pid = self()
pid = spawn(SleepSort, :run, [parent_pid, arr])
start_time = Time.utc_now
IO.puts "result is ..."
receive do
    {:sort_ok, result} -> IO.inspect result
end
Time.diff(Time.utc_now, start_time) |> IO.puts

