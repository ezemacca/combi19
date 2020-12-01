class AgregarPrecioViaje < ActiveRecord::Migration[6.0]
  def change
  	add_column :viajes, :precio, :float
  end
end
