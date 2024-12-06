defmodule Day4 do
  def part1(input) do
    grid =
      input
      |> String.trim()
      |> String.split("\n")
      |> Enum.map(&String.graphemes/1)
      |> Enum.with_index()
      |> Enum.flat_map(fn {row, y} ->
        Enum.with_index(row, fn char, x -> {{x, y}, char} end)
      end)
      |> Enum.into(%{})

    # Define all eight possible directions
    directions = [
      # North
      {0, -1},
      # Northeast
      {1, -1},
      # East
      {1, 0},
      # Southeast
      {1, 1},
      # South
      {0, 1},
      # Southwest
      {-1, 1},
      # West
      {-1, 0},
      # Northwest
      {-1, -1}
    ]

    word = "XMAS"
    chars = String.graphemes(word)

    # Find all starting positions (could be 'X' or 'S' due to reverse)
    start_positions =
      grid
      |> Enum.filter(fn {_, char} -> char == "X" end)

    # Search for the word in all directions from each starting position
    occurrences =
      for {start_pos, _} <- start_positions,
          {dx, dy} <- directions,
          match <- check_direction(grid, start_pos, {dx, dy}, chars),
          do: match

    length(occurrences)
  end

  # Helper function to get letters in a given direction and check for matches
  defp check_direction(grid, start_pos, {dx, dy}, chars) do
    positions =
      for i <- 0..(length(chars) - 1) do
        {elem(start_pos, 0) + i * dx, elem(start_pos, 1) + i * dy}
      end

    letters = Enum.map(positions, &Map.get(grid, &1))

    cond do
      letters == chars ->
        [{start_pos, positions, :forward}]

      true ->
        []
    end
  end

  def part2(input) do
    grid =
      input
      |> String.trim()
      |> String.split("\n")
      |> Enum.map(&String.graphemes/1)
      |> Enum.with_index()
      |> Enum.flat_map(fn {row, y} ->
        Enum.with_index(row, fn char, x -> {{x, y}, char} end)
      end)
      |> Enum.into(%{})

    # Define all eight possible directions
    directions = [
      # Northeast
      {1, -1},
      # Southeast
      {1, 1},
      # Southwest
      {-1, 1},
      # Northwest
      {-1, -1}
    ]

    word = "MAS"
    chars = String.graphemes(word)

    # Find all starting positions
    start_positions =
      grid
      |> Enum.filter(fn {_, char} -> char == "M" end)

    # Search for the word in all directions from each starting position
    occurrences =
      for {start_pos, _} <- start_positions,
          {dx, dy} <- directions,
          match <- check_direction(grid, start_pos, {dx, dy}, chars),
          do: match

    middle_coordinates =
      Enum.map(occurrences, fn {_, positions_list, _} ->
        Enum.at(positions_list, 1)
      end)

    Enum.frequencies(middle_coordinates)
    |> Enum.filter(fn {_, count} -> count == 2 end)
    |> length()
  end
end
