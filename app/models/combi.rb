class Combi < ApplicationRecord
	validates :patente, uniqueness:true
end
