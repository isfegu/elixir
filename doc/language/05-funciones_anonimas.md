# 05 - Funciones anónimas

fn <parametros> -> <cuerpo> end

```elixir
iex>​ sum = ​fn​ (a, b) -> a + b ​end​
​   #Function<12.17052888 in :erl_eval.expr/5>
```

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

## Funciones que retornan funciones
fun1 = ​fn​ ->
​          fn​ ->
​            ​"​​Hello"​
​          ​end​
​       ​end​

iex>​ fun1 = ​fn​ -> ​fn​ -> ​"​​Hello"​ ​end​ ​end​
​#Function<12.17052888 in :erl_eval.expr/5>
​
​iex>​ fun1.()
​#Function<12.17052888 in :erl_eval.expr/5>
​
​iex>​ fun1.().()
​"Hello"

O se puede:

```elixir
iex>​ other = fun1.()
​#Function<12.17052888 in :erl_eval.expr/5>
​
​iex>​ other.()
​"Hello"
```

## Funciones que recuerdan el entorno original

​iex>​ greeter = ​fn​ name -> (​fn​ -> ​"​​Hello ​​#{​name​}​​"​ ​end​) ​end​
​#Function<12.17052888 in :erl_eval.expr/5>
​
​iex>​ dave_greeter = greeter.(​"​​Dave"​)
​#Function<12.17052888 in :erl_eval.expr/5>
​
​iex>​ dave_greeter.()
​"Hello Dave"

## Funciones parametrizadas

​iex>​ add_n = ​fn​ n -> (​fn​ other -> n + other ​end​) ​end​
​#Function<12.17052888 in :erl_eval.expr/5>
​
​iex>​ add_two = add_n.(2)
​#Function<12.17052888 in :erl_eval.expr/5>
​
​iex>​ add_five = add_n.(5)
​#Function<12.17052888 in :erl_eval.expr/5>
​
​iex>​ add_two.(3)
​5
​
​iex>​ add_five.(7)
​12

## La notación &
Se pueden crear funciones anónimas mediante el uso del &, sobre todo para cuando estas se usan como
parámetro de otras funciones.

iex> add_one = &(&1 + 1)
​
Es lo mismo que:

iex> add_one = fn (n) -> n + 1 end​

Como parámetro de otra función:

iex> Enum.map [1,2,3,4], &(&1 + 2)

Se usa el & más un número para especificar qué parámetro (su posición) enviado a la variable entra en juego.

iex> sum = &(&1 + &2)