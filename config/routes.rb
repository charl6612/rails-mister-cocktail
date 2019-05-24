Rails.application.routes.draw do
  root to: 'cocktails#index'
  resources :cocktails, only: [:create, :index, :show, :new] do
    resources :doses, only: [:index, :new, :create]
  end
resources :doses, only: [:destroy]

end

