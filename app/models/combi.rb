class Combi < ApplicationRecord
	validates :patente, uniqueness: { case_sensitive: false }
	has_many :choferes
	before_save :minuscula_patente 
	
def minuscula_patente
      self.patente.downcase
end

def mostrar_atributos
	"Modelo: #{modelo.titleize} - Tipo: #{clasificacion.capitalize} - Patente: #{patente.upcase} - Lugares: #{plazas_totales}"	
end
end