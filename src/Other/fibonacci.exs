# Fibonacci

defmodule Fibonacci do
    @moduledoc """
        Módulo para trabajar con la sucesión de Fibonacci

        ## TODO
        - ¿Por qué no muestra una lista cuando se piden más de 50 números?
    """
    @doc """
        Obtiene una lista con los N primeros números de la sucesión de Fibonacci

        Returns: List
    """
    def list(count) do
        _list(0, 1, count - 3, [0,1])
    end

    defp _list(_, _, _ = 0, l) do
        l
    end

    defp _list(n, m, count, l) do
        _list(m, m + n, count - 1, l ++ [(m + n)])
    end

    @doc """
        Obtiene el número de la sucesión de Fibonacci según su posición

        Returns: Number
    """
    def number(position) do
        _number(0, 1, position - 1, 0)
    end

    defp _number(_, _, _ = 1, acc) do
        acc
    end

    defp _number(n, m, position, _) do
        _number(m, m + n, position - 1, m + n)
    end
end
