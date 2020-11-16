class CambiarColumnaViaje < ActiveRecord::Migration[6.0]
  def change
  	change_column :viajes, :origen, :integer
  	change_column :viajes, :destino, :integer
  	change_column :viajes, :ruta, :integer
  	change_column :viajes, :combi, :integer
  	change_column :viajes, :chofer, :integer
  	add_column :viajes, :fecha_llegada, :date
  	add_column :viajes, :hora_llegada, :time
  end
end
