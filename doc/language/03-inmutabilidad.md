# 03 - INMUTABILIDAD

__Siempre transformamos los datos, nunca los modificamos__

__Toda función que transforma datos retorna una copia de estos transformada__

​iex>​ name = ​"​​elixir"​
​"elixir"
​
​iex>​ cap_name = String.capitalize name
​"Elixir"
​
​iex>​ name
​"elixir"