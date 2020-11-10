class Rutum < ApplicationRecord
	validates :nombre, uniqueness:true
end
