# The variable a is bound to the value 2. Which of the following will match?

[ a, b, a ] = [ 1, 2, 3 ]
# No hay ajustes de patrones ya que en el primer ajuste a toma el valor 1 y en el último se realiza una comparación 1 = 3 que da error (not match)

[ a, b, a ] = [ 1, 1, 2 ]
# Exactamente igual que en caso anterior

a = 1

^a = 2
# Al usar ^ se conserva el valor previamente establicido para a. Así que se está haciendo una comparación 1 = 2 que da error (not match)

^a = 1
# Igual que en el caso anterior pero sí que exite coincidencia (match) ya que se hace la comparación 1 = 1

^a = 2 - a
# Se resuelve la operación 2 - a que es 2 - 1 que da 1 y se compara con el valor de a quedando una comparación 1 = 1 existiendo coincidencia (match)