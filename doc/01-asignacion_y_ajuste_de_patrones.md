# 01 - ASIGNACIÓN Y AJUSTE DE PATRONES (PATTERN MATCHING)

## ASIGNACIÓN

El = no es únicamente un signo de asignación es también un signo de afirmación.
​
Si el elemento de la izquierda del igual es una variable Elixir puede encontrar una unión entre ellos y entonces
el igual funciona como una asignación, por ejemplo:
​
iex>​ a = 1
​1
​​
iex>​ b = "abc"
​"abc"

iex>​ b = a
​1

iex>​ a
​1

iex>​ b
​1
​​
​​​​En el caso que el elemento de la izquierda del igual no sea una variable el igual funciona como una comparación, por ejemplo:

iex>​ 1 = a
​1

iex>​ 1 = b
​1

​​iex>​ 2 = a
​​**​ (MatchError) no match of right hand side value: 1

iex>​ "abc" = b
​​**​ (MatchError) no match of right hand side value: 1

Elixir únicamente cambia el valor de una variable si ésta está a la izquierda del igual. En los ejemplos
anteriores, sería como hacer:

iex> 2 = 1
​​**​ (MatchError) no match of right hand side value: 1

iex> "abc" = 1
​​**​ (MatchError) no match of right hand side value: 1

## AJUSTE DE PATRONES (PATTERN MATHCING)

Siguiendo con el igual y su doble uso de asignación y comparación, tenemos una lista:

**Nomenclatura de las listas**

["hola", "mundo"]
["hola", "mundo", ["foo", "bar", 1]]

iex> list = [1,2,3]
[1,2,3]

iex> [a,b,c] = list
[1,2,3]

iex> a
1

iex> b
2

iex> c
3

Al tener en el lado izquierdo una lista de variables, el = actúa como asignación pero en este
caso con la "inteligencia" de asignar (match) a cada variable de la lista de la izquierda (pattern) su correspondiente
de la derecha.

Si alguno de los elementos de la izquierda no puede ser igualado con uno de la derecha dará un error:

iex> [a,b,c,d] = list
** (MatchError) no match of right hand side value: [1, 2, 3]

Y viceversa

iex> [a,b,c] = [1,2,3,4]
** (MatchError) no match of right hand side value: [1, 2, 3, 4]

Si en el lado izquierdo a parte de variables tenemos valores, Elixir asignará en el caso de variables
y comparará en el caso de valores, por ejemplo:

iex>​ list = [1, 2, 3]
​[1, 2, 3]
​
​iex>​ [a, 2, b ] = list
​[1, 2, 3]
​
​iex>​ a
​1
​​
iex>​ b
​3

Se puede ver que se asignan para a y b los valores correspondientes de la derecha y se compara el 2.

En cambio:

iex>​ [a, 1, b ] = list
​**​ (MatchError) no match of right hand side value: [1, 2, 3]

El 1 de la izquierda no es igual a su correspondiente de la derecha.

Podemos escamotear valores mediante el guión bajo, "_":

iex>​ [1, _, _] = [1, 2, 3]
​[1, 2, 3]
​
​iex>​ [1, _, _] = [1, ​"​​cat"​, ​"​​dog"​]
​[1, "cat", "dog"]

### VARIABLES ENLAZADAS UNA VEZ (BIND ONCE)

Una vez una variable es "enlaza" con su valor, ésta mantiene ese valor en el resto de proceso de ajuste de patrones:

​iex>​ [a, a] = [1, 1]
​[1, 1]

A la variable a se le asigna el valor 1 (primer ajuste de patrones). En el segundo ajuste, se realiza una comparación 1 = 1
​
​iex>​ a
​1
​
Podemos aclarar este comportamiento viendo un error

​iex>​ [b, b] = [1, 2]
​**​ (MatchError) no match of right hand side value: [1, 2]

A la variable b se le asigna el valor 1 (primer ajuste de patrones). En el segundo ajuste, se realiza una comparación 1 = 2 que no coincide.

Si la variable tiene un valor establecido anteriormente, éste no afecta en el ajuste de patrones:

iex>​ a = 1
1
​
​iex>​ [1, a, 3] = [1, 2, 3]
​[1, 2, 3]
​
​iex>​ a
​2

Si queremos que sí que el valor anterior sea conservado podemos usar el circunflejo, "^":

Tanto en ajuste de patrones:

iex>​ a = 1
​1
​
​iex>​ [^a, 2, 3 ] = [ 1, 2, 3 ]
​[1, 2, 3]
​
​iex>​ a = 2
​2
​
​iex>​ [ ^a, 2 ] = [ 1, 2 ]
​​**​ (MatchError) no match of right hand side value: [1, 2]

Como en comparaciones simples:

​iex>​ a = 1
​1
​
​iex>​ a = 2
​2
​
​iex>​ ^a = 1
​​**​ (MatchError) no match of right hand side value: 1
