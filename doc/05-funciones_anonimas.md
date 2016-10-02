# 05 - Funciones anónimas

fn <parametros> -> <cuerpo> end

iex>​ sum = ​fn​ (a, b) -> a + b ​end​
​   #Function<12.17052888 in :erl_eval.expr/5>

Se llama a la función:

iex> sum.(3,4)
7

Se pueden no pasar parámetros:

​iex>​ greet = ​fn​ -> IO.puts ​"​​Hello"​ ​end​
​   #Function<12.17052888 in :erl_eval.expr/5>
​
​iex>​ greet.()
​Hello
​:ok

Se pueden omitir los paréntesis de los parámetros

iex>​ f1 = ​fn​ a, b -> a * b ​end​
​   #Function<12.17052888 in :erl_eval.expr/5>
​
iex>​ f1.(5,6)
​30

## Funciones y ajuste de patrones

​iex>​ swap = ​fn​ { a, b } -> { b, a } ​end​
​   #Function<12.17052888 in :erl_eval.expr/5>
​
​iex>​ swap.( { 6, 8 } )
​{8, 6}

## Diferentes cuerpos de función para una misma función
Se pueden especificar diferentes cuerpos para una misma función dependiendo del tipo de parámetros, no del número.
Esto se realiza gracias al ajuste de patrones.

​iex>​ handle_open = ​fn​
​​...>​   {​:ok​, file}  -> ​"​​Read data: ​​#{​IO.read(file, ​:line​)​}​​"​
​​...>​   {_,   error} -> ​"​​Error: ​​#{​​:file​.format_error(error)​}​​"​
​​...>​ ​end​

En el ejemplo, si los parámetros son {:ok, file} ejecutará el cuerpo, "​​Read data: ​​#{​IO.read(file, ​:line​)​}​​"​
En el caso que el primer parámetro no sea :ok, ejecutará el cuerpo "​​Error: ​​#{​​:file​.format_error(error)​}​​"​