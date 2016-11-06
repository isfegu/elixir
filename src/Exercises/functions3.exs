# The operator rem(a, b) returns the remainder after dividing a by b.
# Write a function that takes a single integer (n) and calls the function in the previous exercise, passing it rem(n,3), rem(n,5), and n.
# Call it seven times with the arguments 10, 11, 12, and so on.
# You should get “Buzz, 11, Fizz, 13, 14, FizzBuzz, 16.”

fizzbuzz = fn
  (0, 0, _) -> IO.puts "FizzBuzz"
  (0, _, _) -> IO.puts "Fizz"
  (_, 0, _) -> IO.puts "Buzz"
  (_, _, c) -> IO.puts c
end

range = 10..16

Enum.each(range,
  fn (n) ->
    fizzbuzz.(
      rem(n,3),
      rem(n,5),
      n
    )
  end
)