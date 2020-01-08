# Autor:: Christian Torres Gonzalez
# Universidad de La laguna
# Lenguajes y Paradigmas de Programacion
#
# == Documentacion RDOC
#
# === Clase Comida
#
# Definición de la clase Comida con los metodos:
# * metodo initialize
# * <=>
# * to_s
# * calculo_valor_energetico
# * impacto_ambiental_hombre
# * impacto_ambiental_mujer
#

module Comida
  class Menu
    attr_reader :nombre, :descripcion, :platos, :precios, :precio_total, :v_nutricional, :v_ambiental

    def initialize(nombre, &block)
      @nombre = nombre
      @platos = []

      if block_given?
        if  block.arity == 1
          yield self
        else
          instance_eval(&block)
        end
      end
    end

    def descripcion(descrip)
      @descripcion = descrip
    end

    def plato(nombre, options = {})
      plato = nombre
      plato << "(#{options[:descripcion]})" if options[:descripcion]
      plato << "(#{options[:cantidad]})" if options[:cantidad]
      plato << "(#{options[:precio]})" if options[:precio]

      @platos << plato
    end

    def preparacion(descripcion, options = {})
      preparar = descripcion
      preparar << "(#{options[:duracion]})" if options[:duracion]

      @platos << preparar
    end

    def precio_total(precio)
      @precio_total = precio
    end

    def valor_nutricional(valor)
      @v_nutricional = valor
    end

    def valor_ambiental(valor)
      @v_ambiental = valor
    end

    def to_s
      output = @nombre
      output << "\n#{'=' * @nombre.size}\n\n"
      output << "Platos : \n\n"

      @platos.each_with_index do |plato, index|
        output << "#{index + 1}) #{plato[:descripcion]}, #{plato[:cantidad]}, #{plato[:precio]}\n"
      end

      output
    end
  end
end
