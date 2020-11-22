class IntentoDeAgregarForeignKey < ActiveRecord::Migration[6.0]
  def change
  	add_reference(:calificacions, :viajes, foreign_key: { to_table: :viajes })
  end
end
