# Write a function prefix that takes a string.
# It should return a new function that takes a second string.
# When that second function is called, it will return a string containing the first string, a space, and the second string

prefix = fn (p) ->
            fn (name) ->
                IO.puts "#{p} #{name}"
            end
        end

mrs = prefix.("Mrs")
mrs.("Smith")
prefix.("Elixir").("Rocks")