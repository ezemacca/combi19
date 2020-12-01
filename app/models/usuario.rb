class Usuario < ApplicationRecord
  #has_many :calificacions, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  #validates :vencimiento,presence: true, if: :suscripcion 
  

  validates :nrotarjeta,
  						 numericality: true,
  						 length: { is: 16 },
  						 presence: true, if: :suscripcion
  validates :codseguridad, numericality: true,
  						   length: { in: 3..4 },
  						   presence: true, if: :suscripcion 
  validates :telefono, format: { with: /[0-9]/ }, if: :validar_chofer
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :DNI, numericality: true , length: {in:7..9}, uniqueness: true
  validate :vencimiento_tarjeta
  has_many :pasajes
 default_scope -> { order :apellido }
  #scope :ordered, -> { includes(:usuarios).order('apellido') } 
  

  # before_action:confirmar_compra, only[confirmar_compra]
  def confirmar_compra
  end
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

  def vencimiento_tarjeta
  	if self.suscripcion
  		if self.vencimientoAño < Time.now.year
  			errors.add(:vencimientoAño, "Esta tarjeta esta vencida año")
  		elsif self.vencimientoAño == Time.now.year
  			if self.vencimientoMes < Time.now.month
  				errors.add(:vencimientoMes, "Esta tarjeta esta vencida")  				
  			end
  		end
  	end  		 		 	
  end

  #def dia
  #	self.vencimiento.change(day: 1) 	
  #end
end
