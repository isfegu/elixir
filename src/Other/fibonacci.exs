defmodule Fibonacci do
    @moduledoc """
        Módulo para trabajar con la sucesión de Fibonacci
    """

    @doc """
        Obtiene una lista con los N primeros números de la sucesión de Fibonacci

        Returns: List
    """
    def list(0), do: []
    def list(1), do: [1]
    def list(count) do
        list(0, 1, count - 2, [0, 1])
    end
    def list(_, _, 0, l) do
        l
    end
    def list(n, m, count, l) do
        list(m, m + n, count - 1, l ++ [(m + n)])
    end

    @doc """
        Obtiene el número de la sucesión de Fibonacci según su posición

        Returns: Number
    """
    def get(0), do: 1
    def get(position) do
        get(0, 1, position - 1, 1)
    end
    def get(_, _, 0, acc) do
        acc
    end
    def get(n, m, position, _) do
        number(m, m + n, position - 1, m + n)
    end
end


