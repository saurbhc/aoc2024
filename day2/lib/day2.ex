defmodule Day2 do
  def part1(input) do
    input
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(&String.split/1)
    |> Enum.map(&is_safe/1)
    |> Enum.count(& &1)
  end

  defp is_safe(list) do
    list_n = Enum.map(list, &String.to_integer/1)

    list_n_diffs =
      list_n
      |> Enum.chunk_every(2, 1, :discard)
      |> Enum.map(fn [a, b] -> b - a end)

    list_n_safe =
      list_n_diffs
      |> Enum.map(&abs/1)
      |> Enum.all?(&(&1 in 1..3))

    list_n_increasing = Enum.all?(list_n_diffs, &(&1 > 0))
    list_n_decreasing = Enum.all?(list_n_diffs, &(&1 < 0))

    list_n_safe and (list_n_increasing or list_n_decreasing)
  end

  def part2(input) do
    input
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(&String.split/1)
    |> Enum.filter(fn list -> is_safe(list) or is_unsafe_variants_safe(list) end)
    |> Enum.count()
  end

  defp is_unsafe_variants_safe(list) do
    Enum.any?(
      0..(length(list) - 1),
      fn index ->
        list
        |> List.delete_at(index)
        |> is_safe()
      end
    )
  end
end
