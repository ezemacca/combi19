class Lugar < ApplicationRecord
	validates :ciudad, uniqueness:true 
	def mostrar_atributos
		"#{ciudad} - #{provincia}"
	end
end
