class CreateLugars < ActiveRecord::Migration[6.0]
  def change
  	#Tabla de lugares con sus atributos provicia y ciudad
    create_table :lugars do |t|
      t.string :provincia
      t.string :ciudad	

      t.timestamps
    end
  end
end
