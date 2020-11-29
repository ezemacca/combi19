class Pasaje < ApplicationRecord
	has_and_belongs_to_many :productos
	#mas_one :covidform
end
