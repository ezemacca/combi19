class CreateCombis < ActiveRecord::Migration[6.0]
  def change
    create_table :combis do |t|
      t.string :clasificacion
      t.integer :plazas_totales
      t.integer :plazas_libres
      t.string :modelo
      t.string :patente

      t.timestamps
    end
  end
end
