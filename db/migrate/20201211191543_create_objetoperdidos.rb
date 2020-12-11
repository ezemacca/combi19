class CreateObjetoperdidos < ActiveRecord::Migration[6.0]
  def change
    create_table :objetoperdidos do |t|
      t.string :nombre
      t.string :descripcion
      t.integer :viaje_id

      t.timestamps
    end
  end
end
