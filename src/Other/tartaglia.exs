defmodule Tartaglia do
    def get(1), do: [1]
    def get(2), do: [1,1]

    def get(n) do
        l = get(n - 1)
        [1] ++ eval(l, []) ++ [1]
    end

    def eval([], acc), do: acc
    def eval([h|t], acc) do
        if Enum.count(t) > 0 do
            eval(t, acc ++ [(h + hd(t))])
        else
            acc
        end
    end
end