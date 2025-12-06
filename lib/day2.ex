defmodule Day2 do
  def main() do
    with {:ok, content} <- File.read("lib/inputs/day2.txt") do
      ids =
        content
        |> String.trim()
        |> String.split(",")
        |> Enum.map(&transform_to_range_list/1)
        |> List.flatten()

      p1 =
        ids
        |> Enum.filter(&is_invalid_pt1/1)
        |> Enum.sum()

      IO.puts(p1)

      p2 =
        ids
        |> Enum.filter(&is_invalid_pt2/1)
        |> Enum.sum()

      IO.puts(p2)
    else
      {:error, reason} -> {:error, "failed to read file: #{reason}"}
    end
  end

  defp transform_to_range_list(id_range) do
    [lo, hi] = String.split(id_range, "-")
    Enum.to_list(String.to_integer(lo)..String.to_integer(hi))
  end

  defp is_invalid_pt1(id) do
    id_str = Integer.to_string(id)
    half = div(String.length(id_str), 2)

    id_str
    |> String.slice(0, half)
    |> String.duplicate(2) == id_str
  end

  defp is_invalid_pt2(id) do
    id_str = Integer.to_string(id)
    id_str_len = String.length(id_str)

    if id_str_len <= 1 do
      false
    else
      Enum.to_list(1..div(id_str_len, 2))
      |> Enum.filter(fn i -> rem(id_str_len, i) == 0 end)
      |> Enum.any?(fn i ->
        repeats = div(id_str_len, i)

        String.slice(id_str, 0, i)
        |> String.duplicate(repeats) == id_str
      end)
    end
  end
end
