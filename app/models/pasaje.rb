class Pasaje < ApplicationRecord
	has_and_belongs_to_many :productos
	has_many :invitados
	has_one :calificacion
	has_one :testeo
end
