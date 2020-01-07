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
  class Plato_bloque
    attr_reader :nombre, :alimentos

    def initialize(name, &block)
      @nombre = name
      @alimentos = []

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

    def alimento(descripcion, options = {})
      descripcion << "(#{options[:description]})" if options[:description]
      descripcion << "(#{options[:gramos]})" if options[:gramos]

      @alimentos << descripcion
    end

    def to_s
      output = @nombre
      output << "\n#{'=' * @nombre.size}\n\n"
      output << "Platos : #{@alimentos.join(', ')}\n\n"

      @alimentos.each_with_index do |alimento, index|
        output << "#{index + 1}) #{alimento}\n"
      end

      output
    end

  end
end
