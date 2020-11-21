class Usuario < ApplicationRecord
  has_many :calificacions, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :vencimiento, presence: true, if: :suscripcion 
  validates :nrotarjeta,
  						 numericality: true,
  						 length: { is: 16 },
  						 presence: true, if: :suscripcion
  validates :codseguridad, numericality: true,
  						   length: { in: 3..4 },
  						   presence: true, if: :suscripcion
  validates :DNI, numericality: true 
  validates :telefono, format: { with: /[0-9]/ }, if: :validar_chofer
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 validates :DNI, numericality: true, length: {in:7..9}
 
 default_scope -> { order :apellido }
  #scope :ordered, -> { includes(:usuarios).order('apellido') } 
  
def validar_chofer
    if self.role=="chofer"
      return true
    else
      return false
    end
  end
  def mostrar_atributos
    "#{apellido.titleize} #{nombre.titleize}"    
  end
end
