class Combi < ApplicationRecord
	validates :patente, uniqueness: { case_sensitive: false }
	has_many :choferes
	before_save :minuscula_patente 
	
def minuscula_patente
      self.patente.downcase
end
end