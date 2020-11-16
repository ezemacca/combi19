class CambiarFechaViaje < ActiveRecord::Migration[6.0]
  def change
  	remove_column :viajes, :hora_llegada
  	remove_column :viajes, :hora
  	change_column :viajes, :fecha, :datetime
  	change_column :viajes, :fecha_llegada, :datetime
  end
end
