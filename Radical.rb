#!/usr/bin/env ruby

class Radical < Object
  #Metodos para leer los atributos
  attr_reader :radicando, :coef_radicando
  attr_writer :radicando, :coef_radicando
  def initialize
    @radicando = 1
    @coef_radicando = 1
    @indice = 1
  end
  def simplificar(raiz,indice)
    if raiz == 0
      @radicando = 0
      @coef_radicando = 0
      return 0
    end
    @indice = indice
      #Se crea un objeto factorizador para simplificar la raiz
      factorizador = Factorizador.new
      
      #Se obtienen los factores
      factores = factorizador.factorizar(raiz)
      
      #Se inicializa el radicando
      @radicando = 1
      
      #Se inicializa el coeficiente de la raiz
      @coef_radicando = 1
      
      #Se recorren los factores para determinar cuanto queda en la raiz y cuanto queda fuera de la raiz
      for factor in factores
        @radicando *= factor[0]**(factor[1]%indice)
        @coef_radicando *= factor[0]**(factor[1]/indice)
      end
      #Si el radicando es igual a 1 no queda nada dentro de la raiz y solo queda el coeficiente
      if @radicando == 1
        begin 
          return @coef_radicando.to_s
        end
      else
        return @coef_radicando.to_s+"raiz("+@radicando.to_s+")"
      end
  end
  def get_valor
    return Float(@coef_radicando)*(radicando.to_f ** (1.0 / @indice.to_f))
  end
  def entero?
    if @radicando == 1 || @radicando == 0
      return true
    else
      return false
    end
  end
end
