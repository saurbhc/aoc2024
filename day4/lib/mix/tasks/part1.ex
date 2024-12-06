defmodule Mix.Tasks.Part1 do
  use Mix.Task

  def run(_) do
    File.read!("lib/input.txt")
    |> Day4.part1()
    |> IO.puts()
  end
end
