Rails.application.routes.draw do

  resources :pasajes
  get 'buscador/create'
  get 'calificacions/new(.:id)', to: 'calificacions#new'
  #get 'calificacions/CalificacionesPorViaje', to: 'calificacions#CalificacionesPorViaje'
  resources :calificacions do
    member do
      get :calificacionesporviaje
    end
  end 
  resources :viajes do
  	collection do
  		get :verpasajeros
  	end
  end

  resources :productos
  get 'ruta/alta'
  get 'ruta/index'
  resources :ruta
# Maneja la vista de lugar
  resources :lugar
  resources :chofer


  get 'usuario/index'
  get 'administrador/index'
  get 'welcome/index'
  #get 'combis/new'
  #get 'combis/index'
  #get 'combis/buscar_combi'
  #get 'combis/edit'
  #get 'usuario/comprarpasaje(.:id)', to: 'usuario#comprarpasaje'
  

  #patch 'usuario/comprarpasaje' => "usuario#agregarproducto"
  
  #post 'usuario/comprarpasaje' => "usuario#confirmarcompra"

  post 'combis' => "combis#create"
  resources :combis
  devise_for :usuarios



  get 'usuario/VerViajesUsuario'
  
  resources :usuario do
    member do
      patch :agregarproducto
      get :confirmarcompra
      get :comprarpasaje
      delete :cancelarproducto
      get :nuevoinvitado
      post :crearinvitado
      patch :verificartarjeta
      patch :finalizarcompra
      get :showpasaje
      delete :cancelarinvitado
      delete :cancelarpasaje
    end
  end
  root 'welcome#index'

  resources :expres do
    collection do 
      get :rolexpres
      patch :actualizarcuenta
      get :comprarexpres
      get :viajesencurso
      post :confirmarusuario
    end
  end
  resources :vistachofer do
  	member do
  	   get :pasajeros
  	   get :iniciarviaje
  	   get :finalizarviaje
  	   get :historialviajes
  	end
  end

  resources :testeos

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
