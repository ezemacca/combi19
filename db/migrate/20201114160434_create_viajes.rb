class CreateViajes < ActiveRecord::Migration[6.0]
  def change
    create_table :viajes do |t|
      t.date :fecha
      t.time :hora
      t.boolean :eliminado

      t.timestamps
    end
  end
end
