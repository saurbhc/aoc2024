defmodule Day2Test do
  use ExUnit.Case
  doctest Day2

  setup do
    {
      :ok,
      input: """
      7 6 4 2 1
      1 2 7 8 9
      9 7 6 2 1
      1 3 2 4 5
      8 6 4 4 1
      1 3 6 7 9
      """
    }
  end

  test "part1", %{input: input} do
    assert Day2.part1(input) == 2
  end

  test "part2", %{input: input} do
    assert Day2.part2(input) == 4
  end
end
