defmodule Tartaglia do
    @moduledoc """
        Módulo para la obtención del triángulo de tartaglia
    """
    @doc """
        Retorna la lista de números según su posición en el triángulo de targaglia
    """
    def get(0), do: [1]
    def get(1), do: [1,1]
    def get(n) do
        l = get(n - 1)
        [1] ++ eval(l, []) ++ [1]
    end

    @doc """
        Según una lista dada retorna una lista con la suma de sus elementos en razón de 1º con  2º, 2º con 3º, etc
    """
    def eval([], acc), do: acc
    def eval([h|t], acc) do
        if Enum.count(t) > 0 do
            eval(t, acc ++ [(h + hd(t))])
        else
            acc
        end
    end
end