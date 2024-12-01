defmodule Day1 do
  def part1(input) do
    {list1, list2} =
      input
      |> String.trim()
      |> String.split("\n")
      |> Enum.map(&parse_line/1)
      |> Enum.unzip()

    list1 = Enum.sort(list1)
    list2 = Enum.sort(list2)

    Enum.zip(list1, list2)
    |> Enum.map(fn {a, b} -> abs(a - b) end)
    |> Enum.sum()
  end

  defp parse_line(line) do
    line
    |> String.split("   ")
    |> Enum.map(&String.to_integer/1)
    |> List.to_tuple()
  end

  def part2(input) do
    {list1, list2} =
      input
      |> String.trim()
      |> String.split("\n")
      |> Enum.map(&parse_line/1)
      |> Enum.unzip()

    list1
    |> Enum.map(fn a ->
      list2
      |> Enum.count(fn b -> abs(a - b) == 0 end)
      |> Kernel.*(a)
    end)
    |> Enum.sum()
  end
end
