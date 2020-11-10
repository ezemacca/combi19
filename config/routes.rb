Rails.application.routes.draw do

  get 'ruta/alta'
  post 'ruta' => "ruta#create"

# Maneja la vista de lugar
  resources :lugar

  get 'choferes/index'
  get 'usuario/index'
  get 'administrador/index'
  get 'welcome/index'
  get 'combis/new'
  get 'combis/index'
  post 'combis' => "combis#create"
  devise_for :usuarios

  root 'welcome#index'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
