class CreateProductos < ActiveRecord::MigrNombre: Atun

Descripcion: dos latas

Precio: 600

Stock: 5

Eliminado: falseation[6.0]
  def change
    create_table :productos do |t|
      t.string :nombre
      t.string :descripcion
      t.integer :precio
      t.integer :stock
      t.boolean :eliminado

      t.timestamps
    end
  end
end
