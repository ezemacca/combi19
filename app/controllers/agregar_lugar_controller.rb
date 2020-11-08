class AgregarLugarController < ApplicationController
  def index
  
  end

  def create
    @lugar = Lugar.new(params.require(:lugar).permit(:provincia, :ciudad))
    @lugar.save
    redirect_to administrador_index_path
  end
end
