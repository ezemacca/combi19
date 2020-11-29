class AddColumnaCantidad < ActiveRecord::Migration[6.0]
  def change
  	add_column :pasajes_productos, :cantidad, :integer, default: 1
  end
end
