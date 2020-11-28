class CreateInvitados < ActiveRecord::Migration[6.0]
  def change
    create_table :invitados do |t|
      t.string :nombre
      t.string :apellido
      t.string :DNI
      t.string :integer

      t.timestamps
    end
  end
end
