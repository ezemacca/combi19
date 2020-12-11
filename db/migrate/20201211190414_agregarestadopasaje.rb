class Agregarestadopasaje < ActiveRecord::Migration[6.0]
  def change
  	add_column :pasajes, :presenciapasajero, :string, default: "pendiente"
  end
end
