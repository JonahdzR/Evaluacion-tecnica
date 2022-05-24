#1. Hacer una clase en Python llamada "prime_class" que tenga un método llamado "is_prime" y que reciba como entrada un número 
# entero y que de salida regrese un True o False en boolean (no usar cadenas), para saber si sí es un número primo o no lo es, 
# respectivamente.


# El imput permite al usuario agregar un número en la consola
#num = int(input('Ingresa un número: '))

class prime_class:
    num = int(input('Ingresa un número: ')) # El imput permite al usuario agregar un número en la consola

    def is_prime(num): # se define la funcion is_prime para validar si es primo o no
        for n in range(2, num): # se inicia un bucle empezando desde el 2 y terminando en el número ingresado
            if num % n == 0: # en caso de que el residuo se obtenga un 0, significa que el número no es primo, retorna False
                return False
        return True # de lo contrario retornara True, confirmando que si es un número primo
    result = is_prime(num)

# Segun el resultado obtenido (True o False), imprimira la leyenda de si es o no número primo   
    if result is True:
        print('El número es primo')
    else:
        print('El número NO es primo')

# se llama la clase
prime_class()
