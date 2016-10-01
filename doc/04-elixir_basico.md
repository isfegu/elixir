# 04 - Elixir básico

## Tipos de datos

- De valor
  - Integers
  - Floating-point numbers
  - Atoms
  - Ranges
  - Regular expressions
- De sistema
  - PIDs y ports
- De Colección
  - Tuples
  - Lists y Keyword list
  - Maps
  - Binaries
  - Date y Time

### Integers
Se pueden escribir en decimal (1234), en hexadecimal (0x14), en octal (0o646) y en binario (0b1001).

No tienen un tamaño definido.

### Floating-point numbers
1.0 0.3445 0.9495e2 5.3449e-5

### Atoms
:fred​  ​:is_binary?​  ​:var​​@​2  ​:<>​  ​:===​  ​:"func/3"​  ​:"long john silver"​

El nombre de un atom es su valor.

### Ranges
1..4 -> De 1 a 4
10..1 -> De 10 a 1

### Regular expressions
~r{regex}, options

### PIDs y ports
PID es la referencia a un proceso local o remoto.
Port es la referencia a un recurso.

### Tuples
Es una colección ordenada de valores.

{1,2}  { :foo, 42, "bar"}

Una tupla en Elixir tiene típicamente entre 2 y 4 valores. Si necesitas más, mejor usar Maps o Structs.
Es común también que las funciones retornen tuplas donde el primer elemento es el atom :ok si no han sucedido errores.

### Listas
Es una estructura de datos enlazados.

[1,2,3]

Las **keyword list** ofrecen una lista de pares clave/valor.

[foo: "bar", hola: "mundo"]

Elixir lo transformará en una lista de tuplas:

[{:foo, "bar"}, {:hola, "mundo"}]

### Maps
Un map es una colección de pares clave/valor.

%{"foo" => "bar", "hola" => "mundo"} -> Las claves son strings
%{:foo => "bar", :hola => "mundo"} -> Las claves son atoms
%{ {:error, :enoent} => :fatal, {:error, :busy} => :retry } -> Las claves son tuplas

Los tipos de los elementos de un map no tienen por que ser el mismo:

%{"foo" => "bar", :hola => "mundo"}

Si las claves son atoms, se puede escribir de dos formas:

%{:foo => "bar", :hola => "mundo"} -> La que ya conocemos
%{foo: "bar", hola: "mundo"} -> Una alternativa más cómoda

También se pueden utilizar expresiones como claves:

​iex>​ name = ​"​​José Valim"​
​"José Valim"
​
​iex>​ %{ String.downcase(name) => name }
​%{"josé valim" => "José Valim"}

La diferencia entre un Map y un Keyword list es que el Map no permite repetir claves mientras que
la Keyword list permite repetir claves.
En general se usan keywords lists como paso de parámetros u opciones y los maps cuando quieres un array asociativo.

Se acceden a los valores de un map mediante su clave:

iex> m = %{"foo" => "bar", "hola" => "mundo"}

iex> m["foo"]
"bar"

iex> m = %{:foo => "bar", :hola => "mundo"}

iex> m[:foo]
"bar"

iex> m = %{ {:error, :enoent} => :fatal, {:error, :busy} => :retry } -> Las claves son tuplas

iex> m[{:error, :noent}]
:fatal

Si las claves son atoms se puede usar una sintaxis alternativa:

iex> m = %{:foo => "bar", :hola => "mundo"}

iex> m.foo
"bar"

### Binaries
iex>​ bin = << 1, 2 >>
​<<1, 2>>
​
​iex>​ byte_size bin
​2

### Date y Time
​iex>​ d1 = Date.new(2016, 12, 25)
​{:ok, ~D[2016-12-25]}
​
​iex>​ {​:ok​, d1} = Date.new(2016, 12, 25)
​{:ok, ~D[2016-12-25]}
​
​iex>​ d2 = ​~​D[2016-12-25]
​~D[2016-12-25]
​
​iex>​ d1 == d2
​true
​
​iex>​ d1
​~D[2016-12-25]
​
​iex>​ inspect d1, ​structs:​ false
​"%{__struct__: Date, calendar: Calendar.ISO, day: 25, month: 12, year: 2016}"

iex>​ t1 = Time.new(12, 34, 56)
​{:ok, ~T[12:34:56]}
​
iex>​ t2 = ​~​T[12:34:56.78]
​~T[12:34:56.78]
​
​iex>​ t1 == t2
​false
​
​iex>​ inspect t2, ​structs:​ false
​"{:ok, %{__struct__: Time, hour: 12, microsecond: {780000, 2}, minute: 34, second: 56}}"

## Operadores
### Comparación
- === (igualdad estricta 1 === 1.0 es falso)
- !== (diferencia estricta 1 !== 1.0 es cierto)
- == (igualdad de valor 1 == 1.0 es cierto)
- != (diferencia de valor 1 != 1.0 es falso)
- >
- >=
- <
- <=

### Booleanos
Estos esperan que el primer valor sea true o false
- or (a or b, cierto si a es cierto sino b)
- and (a and b, falso si a es falso sino b)
- not (not a, falso si a es cierto sino cierto)

Estos esperan cualquier tipo de valor
- || (a || b, a si a es cierto sino b)
- && (a && b, b si a es cierto sino a)
- ! (!a falso si a es cierto sino cierto)

### Aritméticos
+ - * / div rem

### Unión
- <> (Concatena binarios y strings)
- ++ (Concatena listas)
- -- (Elimina elementos de listas)

### Otros
in

a in enum -> Cierto si a está en una enumeración

## Ámbito de las variables
Las variables son locales a la función donde son definidas (incluidos los parámetros). Los módulos
definen un ámbito para variables definidas en él y no son accesibles dentro de funciones del módulo.

### With
Declaración de ámbitos.

content = ​"​​Now is the time"​
lp  =  ​with​ {​:ok​, file}   = File.open(​"​​/etc/passwd"​),
​             content       = IO.read(file, ​:all​),
​             ​:ok​           = File.close(file),
​             [_, uid, gid] = Regex.run(​~r/_lp:.*?:(\d+):(\d+)/​, content)
​       ​do​
​             ​"​​Group: ​​#{​gid​}​​, User: ​​#{​uid​}​​"​
​       ​end​
​
​IO.puts lp             ​#=> Group: 26, User: 26​
​IO.puts content        ​#=> Now is the time​

#### With y ajuste de patrones

​iex>​ ​with​ [a|_] <- [1,2,3], ​do​: a
​1
​
​iex>​ ​with​ [a|_] <- nil,     ​do​: a
​nil

Con el ejemplo anterior:

result  =  ​with​ {​:ok​, file}   =  File.open(​"​​/etc/passwd"​),
​                 content       =  IO.read(file, ​:all​),
​                 ​:ok​           =  File.close(file),
                 [_, uid, gid] <- Regex.run(​~r/xxx:.*?:(\d+):(\d+)/​, content)
​           ​do​
​                 ​"​​Group: ​​#{​gid​}​​, User: ​​#{​uid​}​​"​
​          ​end​
​
IO.puts inspect(result)       ​#=> nil​