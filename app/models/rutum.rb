class Rutum < ApplicationRecord
	validates :nombre, uniqueness: { scope: [:origen, :destino], case_sensitive: false }
	validate :origen_destino
	before_save :minuscula_nombre


	def origen_destino
		errors.add(:origen, :destino, message: "El origen y el destino tienen que ser distintos") if self.origen == self.destino	
	end

	def minuscula_nombre
		self.nombre.downcase!		
	end

	def mostrar_nombre
		"#{nombre.titleize} | #{Lugar.find(origen).ciudad.titleize} -> #{Lugar.find(destino).ciudad.titleize}"		
	end

	def mostrar_atributos
		"#{nombre.titleize}"		
	end
end
