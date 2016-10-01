# Which of the following will match?

[ a, b, a ] = [ 1, 2, 3 ]
# No hay ajustes de patrones ya que en el primer ajuste a toma el valor 1 y en el último se realiza una comparación 1 = 3 que da error

[ a, b, a ] = [ 1, 1, 2 ]
# Exactamente igual que en caso anterior

[ a, b, a ] = [ 1, 2, 1 ]
# Si que hay ajuste de patrones ya que en el primer ajuste a toma el valor 1 y en el último se realiza una comparación 1 = 1