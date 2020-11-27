class Calificacion < ApplicationRecord
	#belongs_to :usuario
	#belongs_to :viaje
	  validates :puntaje, numericality: true


end
