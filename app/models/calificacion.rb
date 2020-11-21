class Calificacion < ApplicationRecord
	belongs_to :usuario
	belongs_to :viaje
	  validates :puntaje, format: { with: /[1-10]/ }


end
