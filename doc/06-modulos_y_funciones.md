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