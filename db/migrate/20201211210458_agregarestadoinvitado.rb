class Agregarestadoinvitado < ActiveRecord::Migration[6.0]
  def change
  	add_column :invitados, :presenciapasajero, :string, default: "pendiente"
  end
end
