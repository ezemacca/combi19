class Usuario < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :vencimiento, presence: { if: :suscripcion? } 
  validates :nrotarjeta, uniqueness: true,
  						 numericality: true,
  						 length: { is: 16 },
  						 presence: { if: :suscripcion? }
  validates :codseguridad, numericality: true,
  						   length: { in: 3..4 },
  						   presence: { if: :suscripcion? }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
