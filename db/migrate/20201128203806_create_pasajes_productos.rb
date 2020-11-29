class CreatePasajesProductos < ActiveRecord::Migration[6.0]
  def change
    create_table :pasajes_productos do |t|
      t.references :pasaje, null: false, foreign_key: true
      t.references :producto, null: false, foreign_key: true

      t.timestamps
    end
  end
end
