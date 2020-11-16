class Producto < ApplicationRecord
	validates :nombre, uniqueness: { case_sensitive: false }
	before_save :minuscula_nombre 
	
	def minuscula_nombre
   	   self.nombre.downcase!
	end
end
