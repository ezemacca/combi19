class Lugar < ApplicationRecord
	validates :ciudad, uniqueness: { scope: :provincia }
	validates :ciudad, uniqueness: { case_sensitive: false }
	default_scope -> { order :provincia }
	default_scope -> { order :ciudad }
	def mostrar_atributos
		"#{ciudad} - #{provincia}"
	end
end
