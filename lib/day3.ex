defmodule Day3 do
  def main() do
    p1 =
      File.stream!("lib/inputs/day3.txt")
      |> Enum.map(&String.trim/1)
      |> Enum.map(&String.graphemes/1)
      |> Enum.map(&part1/1)
      |> Enum.sum()

    IO.puts(p1)

    p2 =
      File.stream!("lib/inputs/day3.txt")
      |> Enum.map(&String.trim/1)
      |> Enum.map(&String.graphemes/1)
      |> Enum.map(&part2/1)
      |> Enum.sum()

    IO.puts(p2)
  end

  def part1(nums) do
    # if the largest element for the first part is at the end, then we cannot form a two-digit number
    prefix_nums = List.delete_at(nums, length(nums) - 1)

    # get the first element which matches the prefix
    elem =
      Enum.to_list(9..1//-1)
      |> Enum.find(fn x -> Integer.to_string(x) in prefix_nums end)
      |> Integer.to_string()

    # get the list after the earliest occurence of that element, so we can then find the maximum elem to use
    {_prefix, [_x | suffix]} = Enum.split_while(nums, fn x -> x != elem end)
    String.to_integer(elem <> Enum.max(suffix))
  end

  def part2(nums) do
    String.to_integer(part2_helper(nums, 11))
  end

  defp part2_helper(nums, n) do
    # looks like it'll be a similar concept, but recursive
    # needs is at least n - 11, then n - 10, then n - 9 and so on
    prefix_nums = Enum.slice(nums, 0, length(nums) - n)
    # get the first element which matches the prefix
    elem =
      Enum.to_list(9..1//-1)
      |> Enum.find(fn x -> Integer.to_string(x) in prefix_nums end)
      |> Integer.to_string()

    {_prefix, [_x | suffix]} = Enum.split_while(nums, fn x -> x != elem end)

    # we need 1 more integer to fill, so use the previous logic
    if n == 1 do
      elem <> Enum.max(suffix)
    else
      elem <> part2_helper(suffix, n - 1)
    end
  end
end

