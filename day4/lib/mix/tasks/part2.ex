defmodule Mix.Tasks.Part2 do
  use Mix.Task

  def run(_) do
    File.read!("lib/input.txt")
    |> Day4.part2()
    |> IO.puts()
  end
end
