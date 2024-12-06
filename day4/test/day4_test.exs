defmodule Day3Test do
  use ExUnit.Case
  doctest Day4

  setup do
    {
      :ok,
      input: """
      MMMSXXMASM
      MSAMXMSMSA
      AMXSXMAAMM
      MSAMASMSMX
      XMASAMXAMM
      XXAMMXXAMA
      SMSMSASXSS
      SAXAMASAAA
      MAMMMXMMMM
      MXMXAXMASX
      """
    }
  end

  test "part1", %{input: input} do
    assert Day4.part1(input) == 18
  end

  test "part2", %{input: input} do
    assert Day4.part2(input) == 9
  end
end
