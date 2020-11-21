class CreateCalificacions < ActiveRecord::Migration[6.0]
  def change
    create_table :calificacions do |t|
      t.integer :puntaje
      t.string :comentario
      t.belongs_to :usuario
      t.timestamps
    end
  end
end
