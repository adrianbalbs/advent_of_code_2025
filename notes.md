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
