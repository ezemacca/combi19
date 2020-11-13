class Combi < ApplicationRecord
	validates :patente, uniqueness:true
	has_many :choferes
end
