class CreatePasajes < ActiveRecord::Migration[6.0]
  def change
    create_table :pasajes do |t|
      t.float :precio
      

      t.timestamps
    end
  end
end
