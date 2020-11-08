class CreateRuta < ActiveRecord::Migration[6.0]
  def change
    create_table :ruta do |t|
      t.timestamps
    end
  end
end
