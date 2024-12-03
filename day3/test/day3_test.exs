defmodule Day3Test do
  use ExUnit.Case
  doctest Day3

  setup do
    {
      :ok,
      input_part1: """
      xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))
      """,
      input_part2: """
      xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))
      """
    }
  end

  test "part1", %{input_part1: input_part1} do
    assert Day3.part1(input_part1) == 161
  end

  test "part2", %{input_part2: input_part2} do
    assert Day3.part2(input_part2) == 48
  end
end
