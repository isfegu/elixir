defmodule FactorialCompact do
    @moduledoc """
        Otra manera de obtener el factorial de un número
    """

    def of(0), do: 1
    def of(n), do: n * of(n - 1)
end