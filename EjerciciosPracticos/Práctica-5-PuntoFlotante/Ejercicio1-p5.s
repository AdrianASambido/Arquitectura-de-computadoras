.data
n1: .double 9.13 ; genera numeros en punto flotante
n2: .double 6.58
res1: .double 0.0 
res2: .double 0.0

.code
l.d f1, n1($zero) ; carga en f1, n1 a partir de la direccion 0 
l.d f2, n2($zero)
add.d f3, f2, f3

mul.d f4, f2, F1
s.d f3, res1($zero) ; guarda el resultado
s.d f4, res2($zero)
halt