# 06 - Módulos y funciones con nombre

Toda función no anómina (función con nombre) debe englobarse dentro de un módulo:

defmodulde Times do
    def double(n) do
        n * 2
    end
end

Una función (a partir de ahora usaremos función para las funciones no anóminas y función anónima para las que así sean)
puede escribirse de diferentes formas (dentro de un módulo):

La que acabamos de ver:

def double(n) do
    n * 2
end

O

def double(n), do: n * 2

Si em cuerpo de la función es largo podemos hacer:

def greet(greeting, name), do: (
    IO.puts greeting
    IO.puts "¡Hola, #{name}!"
)

## Funciones y ajuste de patrones
En las funciones anónimas el ajuste de patrones se hacía en los parámetros escribiendo un cuerpo de función
adecuado al ajuste deseado:

fizzbuzz = fn
  (0, 0, _) -> IO.puts "FizzBuzz"
  (0, _, _) -> IO.puts "Fizz"
  (_, 0, _) -> IO.puts "Buzz"
  (_, _, c) -> IO.puts c
end

En las funciones no anónimas, el ajuste se hace redifiniendo las funciones para el ajuste deseado:

defmodule Factorial do
    def of(0), do: 1
    def of(n), do: n * of(n - 1)
end