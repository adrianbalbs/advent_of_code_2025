defmodule Day4 do
  def main() do
    # 2d lists would be really slow in elixir since its a linked-list, read into a map instead
    map =
      File.read!("lib/inputs/day4.txt")
      |> String.split("\n")
      |> Enum.map(&String.trim/1)
      |> Enum.map(&String.graphemes/1)
      |> from_nested_list()

    IO.puts(part1(map))
    IO.puts(part2(map))
  end

  defp from_nested_list(list) do
    for {row, i} <- Enum.with_index(list),
        {val, j} <- Enum.with_index(row),
        into: %{} do
      {{i, j}, val}
    end
  end

  defp part1(map) do
    map
    |> Map.filter(fn {key, val} -> val == "@" and is_accessible(map, key) end)
    |> Enum.count()
  end

  defp part2(map) do
    count = fn count, map, total ->
      accessible = for {key, "@"} <- map, is_accessible(map, key), do: key

      if accessible == [] do
        total
      else
        new_map = Map.merge(map, Map.new(accessible, &{&1, "."}))
        count.(count, new_map, total + length(accessible))
      end
    end

    count.(count, map, 0)
  end

  defp is_accessible(map, {row, col}) do
    [{-1, 0}, {-1, -1}, {0, -1}, {1, -1}, {1, 0}, {1, 1}, {0, 1}, {-1, 1}]
    |> Enum.filter(fn {dx, dy} ->
      val = map[{row + dy, col + dx}]
      val != nil and val == "@"
    end)
    |> Enum.count() < 4
  end
end
