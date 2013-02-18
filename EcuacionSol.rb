#!/usr/bin/env ruby

require "Radical"
require "NumImaginario"
require "NumComplejo"

puts "Ingrese el coeficiente del término cuadrático"
a = Integer(gets)

puts "Ingrese el coeficiente del término lineal"
b = Integer(gets)

puts "Ingrese el término independiente"
c = Integer(gets)

#Calcular el discriminante
d = b**2 - 4*a*c

#Si el discriminante es positivo
if d >= 0
  
  #Crear un objeto radical para el discriminante
  radical = Radical.new
  
  #Obtener la raiz simplificada
  raiz = radical.simplificar(d,2)
  
  #Si la raiz del discriminante es exacta
  if radical.entero?
    begin
      #Soluciones en forma de Fracción
      x1 = (-b+radical.get_valor).to_s+"/"+(2*a).to_s
      x2 = (-b-radical.get_valor).to_s+"/"+(2*a).to_s
      #Soluciones reales
      realx1 = (-b+radical.get_valor)/(2*a)
      realx2 = (-b-radical.get_valor)/(2*a)
    end
  else
    begin
      #Soluciones en forma de Fracción
      x1 = "("+(-b).to_s+"+"+raiz+")/"+(2*a).to_s
      x2 = "("+(-b).to_s+"-"+raiz+")/"+(2*a).to_s
      #Soluciones reales
      realx1 = (-b+radical.get_valor)/2
      realx2 = (-b-radical.get_valor)/2
    end
  end
end
#Si el discriminante es negativo
if d<0
  #Se crea un nuevo número imaginario
  imaginario = NumImaginario.new
  
  #Se establecen el radicando y el índice
  imaginario.set_radicando(d,2)
  
  #Se crea un número complejo para la primera raiz
  complejo1 = NumComplejo.new(-b,imaginario,"+")
  #Se crea un número complejo para la segunda raiz
  complejo2 = NumComplejo.new(-b,imaginario,"-")
  
  #Soluciones en forma compleja
  x1 = complejo1.get_num_complejo+"/"+(2*a).to_s
  x2 = complejo2.get_num_complejo+"/"+(2*a).to_s
  #No existen soluciones reales
  realx1 = ""
  realx2 = ""
  
end

puts "Solución 1: "
puts "\tFracionaria: "+x1
puts "\tReal: #{realx1}"
puts "Solución 2: "
puts "\tFracionaria: "+x2
puts "\tReal: #{realx2}"
