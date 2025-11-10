# config/routes.rb
Rails.application.routes.draw do
  # Rotas Devise
  devise_for :users

  # Rotas autenticadas
  authenticated :user do
    root to: "dashboard#index", as: :authenticated_root
  end

  # Rotas não autenticadas (login)
  devise_scope :user do
    unauthenticated do
      root to: "devise/sessions#new", as: :unauthenticated_root
    end
  end

  # Dashboard
  get "dashboard/index"

  # Recursos principais
  resources :notas_fiscais
  resource :certificate, only: [:new, :create, :destroy, :show]
end
