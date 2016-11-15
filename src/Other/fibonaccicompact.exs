defmodule FibonacciCompact do
    @moduledoc """
        Otra manera de obtener la sucesión de Fibonacci
    """

    @doc """
        Obtiene el número de la sucesión de Fibonacci según la posición dada
    """
    def get(0), do: 1
    def get(1), do: 1
    def get(n), do: get(n - 1) + get(n - 2)

    @doc """
        Genera una lista con la sucesión de Fibonnaci con los N primeros números
    """
    def to(0), do: :error
    def to(1), do: [1]
    def to(n) do
        for i <- 1..n, do: get(i - 1)
    end
end