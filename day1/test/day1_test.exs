defmodule Day1Test do
  use ExUnit.Case
  doctest Day1

  setup do
    {
      :ok,
      part1_input: """
      3   4
      4   3
      2   5
      1   3
      3   9
      3   3
      """,
      part2_input: """
      3   4
      4   3
      2   5
      1   3
      3   9
      3   3
      """
    }
  end

  test "part1", %{part1_input: part1_input} do
    assert Day1.part1(part1_input) == 11
  end

  test "part2", %{part2_input: part2_input} do
    assert Day1.part2(part2_input) == 31
  end
end
