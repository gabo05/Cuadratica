#!/usr/bin/env ruby

class Factorizador < Object
  
    def get_submultiplos
    end
#Esta función incializa los valores necesarios y llama a la verdadera función para factorizar
    def factorizar(numero)
      #Arreglo donde se guardan los factores con la cantidad de veces que se encuentran el el número dado
      factores = []
      #Retorna los factores encontrados por la función fact
      if numero >= 0
        return factPositivo(numero,factores,2)
      else
        return factNegativo(numero,factores,2)
      end
    end
  #Función recursiva para encontrar los factores del numero
    def factPositivo(numero, factores, i)
      
      #Se calcula la mitad por que es el mayor factor que puede tener el número
      mitad = numero / 2
      #Se buscan los factores apartir del número que le sigue al ultimo factor encontrado
      until i > mitad
        #Si el módulo del número entre el elemento es 0 es por que es divisible entre el, por lo tanto es un factor
        if numero % i == 0
          begin
            #Se obtiene la cantidad de veces que se encuentra ese factor en el número
            conteo = contar(numero/i,i,1)
            #Se crea un array con el factor y la cantidad de veces que se repite
            factor = [i, conteo]
            #Se agrega el array al array de factores
            factores << factor
            #Se retorna la misma función pero como número se pasa el ultimo número al que se llegó
            #con el factor encontrado y el número que le sigue al factor
            return factPositivo((numero/i**conteo),factores,i+=1)
          end
        end
        i+=1
      end
      #Agregar el ultimo número encontrado
      factores << [numero,1]
      #Si no encuentra otro factor retorna los encontrados
      return factores
    end
    #Función recursiva para encontrar los factores del numero
    def factNegativo(numero, factores, i)
      
      #Se calcula la mitad por que es el mayor factor que puede tener el número
      mitad = numero / 2
      #Se buscan los factores apartir del número que le sigue al ultimo factor encontrado
      until (i*-1) < mitad
        #Si el módulo del número entre el elemento es 0 es por que es divisible entre el, por lo tanto es un factor
        if numero % i == 0
          begin
            #Se obtiene la cantidad de veces que se encuentra ese factor en el número
            conteo = contar(numero/i,i,1)
            #Se crea un array con el factor y la cantidad de veces que se repite
            factor = [i, conteo]
            #Se agrega el array al array de factores
            factores << factor
            #Se retorna la misma función pero como número se pasa el ultimo número al que se llegó
            #con el factor encontrado y el número que le sigue al factor
            return factNegativo((numero/i**conteo),factores,i+=1)
          end
        end
        i+=1
      end
      #Agregar el ultimo número encontrado
      factores << [numero,1]
      #Si no encuentra otro factor retorna los encontrados
      return factores
    end
  #Función recursiva para encontrar cuantas veces se puede dividir un número entre otro
    def contar (numero,factor,conteo)
      #Si el número es divisible entre el supuesto factor se rotorna la misma función, con el cociente que seria el siguiente número en factorizar
      if numero % factor == 0
        return contar( (numero / factor), factor, conteo+=1) 
      end
      return conteo
    end  
end
