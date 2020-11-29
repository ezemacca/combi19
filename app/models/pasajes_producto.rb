class PasajesProducto < ApplicationRecord
  belongs_to :pasaje
  belongs_to :producto
end
