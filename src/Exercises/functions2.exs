# Write a function that takes three arguments.
# If the first two are zero, return “FizzBuzz.”
# If the first is zero, return “Fizz.”
# If the second is zero, return “Buzz.”
# Otherwise return the third argument.
# Do not use any language features that we haven’t yet covered in this book.

fizzbuzz = fn
  (0, 0, _) -> IO.puts "FizzBuzz"
  (0, _, _) -> IO.puts "Fizz"
  (_, 0, _) -> IO.puts "Buzz"
  (_, _, c) -> IO.puts c
end

fizzbuzz.(0,0,3)
fizzbuzz.(0,2,3)
fizzbuzz.(1,0,3)
fizzbuzz.(1,2,3)