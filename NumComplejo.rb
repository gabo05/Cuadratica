#!/usr/bin/env ruby

require "NumImaginario"

class NumComplejo < Object
  def initialize(real,imaginaria,signo)
    @real = real
    @imaginaria = imaginaria
    @signo = signo
  end
  def real
    @real
  end
  def real=(real)
    @real = real
  end
  def imaginaria
    @imaginaria
  end
  def imaginaria=(imaginaria)
    @imaginaria = imaginaria
  end
  def signo
    @signo
  end
  def signo=(signo)
    @signo = signo
  end
  def get_num_complejo
    return @real.to_s+@signo+@imaginaria.get_num_imaginario
  end
end
