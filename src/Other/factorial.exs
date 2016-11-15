defmodule Factorial do
    @moduledoc """
        Módulo para obtener el factorial de un número
    """

    def of(n) do
        of(n, n)
    end

    def of(acc, 1) do
        acc
    end

    def of(acc, n) do
        of(acc * (n - 1), n - 1)
    end
end