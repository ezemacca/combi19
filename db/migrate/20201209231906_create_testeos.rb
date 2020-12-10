class CreateTesteos < ActiveRecord::Migration[6.0]
  def change
    create_table :testeos do |t|
      t.float :temperatura
      t.boolean :pregunta1
      t.boolean :pregunta2
      t.boolean :pregunta3
      t.boolean :sospechado

      t.timestamps
    end
  end
end
