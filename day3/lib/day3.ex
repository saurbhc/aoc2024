defmodule Day3 do
  def part1(input) do
    regex = ~r/mul\((\d{1,3}),(\d{1,3})\)/

    Regex.scan(regex, input)
    |> Enum.map(fn [_full_match, x, y] ->
      String.to_integer(x) * String.to_integer(y)
    end)
    |> Enum.sum()
  end

  def part2(input) do
    regex = ~r/(?:do\(\)|don't\(\)|mul\(\d{1,3},\d{1,3}\))/

    Regex.scan(regex, input)
    |> handle_instructions(true, [])
    |> process_muls()
  end

  defp process_muls(muls) do
    regex = ~r/mul\((\d{1,3}),(\d{1,3})\)/

    muls
    |> Enum.map(fn mul ->
      [_, x, y] = Regex.run(regex, mul)
      String.to_integer(x) * String.to_integer(y)
    end)
    |> Enum.sum()
  end

  defp handle_instructions([], _enabled, muls), do: muls

  defp handle_instructions([instruction | rest], enabled, muls) do
    [inst] = instruction

    if inst == "do()" do
      handle_instructions(rest, true, muls)
    else
      if inst == "don't()" do
        handle_instructions(rest, false, muls)
      else
        if enabled and inst =~ "mul" do
          # enabled, add to muls
          handle_instructions(rest, enabled, muls ++ [inst])
        else
          # disabled, skip adding to muls
          handle_instructions(rest, enabled, muls)
        end
      end
    end
  end
end
