defmodule Day3 do
  def main() do
    File.stream!("lib/inputs/day3.txt")
    |> Enum.map(&String.trim/1)
    |> Enum.map(&part1/1)
    |> Enum.sum()
  end

  def part1(line) do
    nums =
      line
      |> String.graphemes()

    # if the largest element for the first part is at the end, then we cannot form a two-digit number
    prefix_nums = List.delete_at(nums, length(nums) - 1)

    # get the first element which matches the prefix
    elem =
      Enum.to_list(9..1//-1)
      |> Enum.find(fn x -> Integer.to_string(x) in prefix_nums end)
      |> Integer.to_string()

    # get the list after the earliest occurence of that element, so we can then find the maximum elem to use
    {_prefix, [_x | suffix]} = Enum.split_while(nums, fn x -> x != elem end)
    largest = Enum.max(suffix)
    String.to_integer(elem <> largest)
  end
end
