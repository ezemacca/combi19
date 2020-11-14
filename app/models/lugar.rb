class Lugar < ApplicationRecord
	validates :ciudad, uniqueness: { case_sensitive: false }
	default_scope -> { order :provincia }
	default_scope -> { order :ciudad }
	before_save :minuscula_atributos
	def mostrar_atributos
		"#{ciudad.titleize} - #{provincia.titleize}"
	end
	def minuscula_atributos
      self.provincia.downcase!
      self.ciudad.downcase!
    end
end
