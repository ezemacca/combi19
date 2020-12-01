class Invitado < ApplicationRecord
	validates :DNI, numericality: true, length: { in: 7..9 }, uniqueness: true
end
