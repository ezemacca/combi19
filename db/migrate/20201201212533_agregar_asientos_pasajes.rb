class AgregarAsientosPasajes < ActiveRecord::Migration[6.0]
  def change
  	add_column :viajes, :asientos, :integer
  end
end
