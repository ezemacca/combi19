class Producto < ApplicationRecord
	validates :nombre, uniqueness: { case_sensitive: false }
	before_save :minuscula_nombre
	has_and_belongs_to_many :pasajes 
	#belongs_to :pasaje
	def minuscula_nombre
   	   self.nombre.downcase!
	end
end
