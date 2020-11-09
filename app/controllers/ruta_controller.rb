class RutaController < ApplicationController
  def alta
  	@lugar = Lugar.all
  end
end
