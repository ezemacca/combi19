class Invitado < ApplicationRecord
	has_one :testeo
	validates :DNI, numericality: true, length: { in: 7..9 }, uniqueness: true
end
