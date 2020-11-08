Rails.application.routes.draw do
  get 'ruta/alta'
  get 'choferes/index'
  get 'usuario/index'
  get 'administrador/index'
  get 'welcome/index'
  devise_for :usuarios

  root 'welcome#index'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
