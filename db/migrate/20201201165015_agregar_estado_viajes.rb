class AgregarEstadoViajes < ActiveRecord::Migration[6.0]
  def change
  	add_column :viajes, :estado, :string, default: "pendiente"
  end
end
