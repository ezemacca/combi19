class Rutum < ApplicationRecord
	validates :nombre, uniqueness: { scope: :origen, scope: :destino, case_sensitive: false }
	before_save :minuscula_nombre

	def minuscula_nombre
		self.nombre.downcase!		
	end
end
