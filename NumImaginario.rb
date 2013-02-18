#!/usr/bin/env ruby

require "Factorizador"
require "Radical"

class NumImaginario < Radical
  #Metodos de lectura
  attr_reader :coeficiente
  #Metodos de escritura
  attr_writer :coeficiente, :radicando, :coef_radicando
  
  def initialize
    @coeficiente = ""
    @radicando = 1
    @coef_radicando = 1
  end
  #Función que crea el número imaginario a partir del radicando y el índice
  def set_radicando (radicando,indice)
    #Si el radicando es positivo se lanza una excepción
    if radicando >= 0
      raise ArgumentError, "#{radicando}>=0. El argumento no es valido por que no definiría un número imaginario\nDebe ser un número negativo"
    end
    #Si el índice no es par se lanza una excepción
    if indice % 2 != 0
      raise ArgumentError, "#{indice}%2=0. El argumento no es valido por que no definiría un número imaginario\nDebe ser un número par"
    end
    @coeficiente = simplificar(radicando,indice).delete("-")
  end
  
  def get_num_imaginario
    return @coeficiente+"i"
  end
end
