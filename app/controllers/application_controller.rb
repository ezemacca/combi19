	class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
 
  	before_action :configure_permitted_parameters, if: :devise_controller?
 
  	protected
 
  	def configure_permitted_parameters
    	added_attrs = [:nombre, :apellido, :DNI, :suscripcion, :nrotarjeta, :vencimientoAño, :vencimientoMes, :codseguridad, :telefono, :email, :password, :password_confirmation]
    	devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
  	end
end