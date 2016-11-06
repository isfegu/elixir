# Which of the following will match?

a = [1, 2, 3]
# La variable a pasa a ser una lista [1,2,3]

a = 4
# La variable a pasa a ser un 4

4 = a
# Se compara 4 con a (que vale 4). Coinciden (match)

[a, b] = [ 1, 2, 3 ]
# Se asignan a las variables a y b de la lista de la iquierda los valores adecuados de la lista de la derecha. Pero no coinciden ya que falta una variable en la lista de la izquierda para el último valor de la lista de la derecha

a = [ [ 1, 2, 3 ] ]
# La variable a pasa a ser una lista con otra lista [1,2,3] como primer elemento

[a] = [ [ 1, 2, 3 ] ]
# La variable a pasa a ser una lista [1,2,3]. Sutil diferencia con el caso anterior. Es como si las listas "exteriores" se "anularan"

[[a]] = [ [ 1, 2, 3 ] ]
# No hay coincidencia de patrones. Se trata de asignar 1, 2 y 3 a la variable a pero no puede ser. De nuevo las listas se "anulan" quedando una sentencia como a = [1,2,3]
# Se solucionaría con [[a,b,c]] = [[1,2,3]]