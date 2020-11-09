class Lugar < ApplicationRecord

	def mostrar_atributos
		"#{ciudad} - #{provincia}"
	end
end
