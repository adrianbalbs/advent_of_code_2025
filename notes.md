# Day 3
## Part 1
- numbers from 1-9, we need to maximise the largest number we can form from two digits (without changing the order)
- initial algo: loop through to find the largest for the first digit (cut off the last elem of the list) and
  then split at that point, and find the largest of the 2nd, but we get a counter example: 9891
- find earliest occurence of largest prefix
  - 9891 works
  - 989991 works
- if we find the earliest occurence, it gives us a larger window for finding the largest elem
- iterate backwards from 9-1 for list of size n - 1 and find largest in that list
  - Then split on the earliest occurence of that integer, and from the suffix, obtain the maximum elem to use
## Part 2
- I think we can do this recursively, and re-use the logic from part 1 as a base case for when n = 1
- For selecting the prefix, we must ensure that the list size for the prefix list is length(nums) - n
  where n is from 11 down to 1, otherwise, in the suffix, we won't have enough elements to pick from to form a full number

# Day 4
- Reading a 2d list is going to be super slow, since they're implemented with linked-lists, we can use a map as an alternative,
as it is probably better for random-access
- Elixir has list-comprehension syntax (for syntax), could be useful for similar problems
- We can call anonymous fns recursively by passing the reference to the function as a param
