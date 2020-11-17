class ProductosController < ApplicationController
  before_action :set_producto, only: [:show, :edit, :update, :destroy]

  # GET /productos
  # GET /productos.json
  def index
    @productos = Producto.all
  end

  # GET /productos/1
  # GET /productos/1.json
  def show
  end

  # GET /productos/new
  def new
    @producto = Producto.new
  end

  # GET /productos/1/edit
  def edit
  end

  # POST /productos
  # POST /productos.json
  def create
    @producto = Producto.new(producto_params)

    respond_to do |format|
      if @producto.save

        format.html { redirect_to @producto, notice: 'Se creo el producto correctamente.' }
        format.json { render :show, status: :created, location: @producto }
      else
        format.html { 
          p =Producto.find_by(nombre: @producto.nombre.downcase)
          if !p.nil?
            if p.eliminado
              #Aca estoy volviendo a agregar un producto que alguna vez existio y que tiene una bjaa logica
              p.eliminado=false
              p.precio=@producto.precio
              p.descripcion=@producto.descripcion
              p.stock=@producto.stock
              p.save
              redirect_to administrador_index_path, notice: "Se cargo el producto correctamente (2)"
            else
              render :new 
             #redirect_to administrador_index_path, notice: "No se cargo el producto, ya existe"
            end
          else
            render :new
            #redirect_to administrador_index_path, notice: "No se cargo el producto, ya existe"    
          end
       
         }
        format.json { render json: @producto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /productos/1
  # PATCH/PUT /productos/1.json
  def update
    respond_to do |format|
      if @producto.update(producto_params)
        format.html { redirect_to @producto, notice: 'Producto actualizado correctamente.' }
        format.json { render :show, status: :ok, location: @producto }
      else
        format.html { render :edit }
        format.json { render json: @producto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /productos/1
  # DELETE /productos/1.json
  def destroy
  
    respond_to do |format|
      format.html { 
        @producto= Producto.find(params[:id])
        @producto.eliminado=true
        @producto.save
        redirect_to productos_path, notice: "Se elimino correctamente" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_producto
      @producto = Producto.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def producto_params
      params.require(:producto).permit(:nombre, :descripcion, :precio, :stock, :eliminado)
    end
end
