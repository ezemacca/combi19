class Lugar < ApplicationRecord
	validates :ciudad, uniqueness: { scope: :provincia }
	validates :ciudad, uniqueness: { case_sensitive: false }
	def mostrar_atributos
		"#{ciudad} - #{provincia}"
	end
end
