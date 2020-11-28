class RelacionandoPasajeConLosAmigos < ActiveRecord::Migration[6.0]
  def change
  	add_reference :pasajes, :viaje
     add_reference :pasajes, :usuario
  end
end
