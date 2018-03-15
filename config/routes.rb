Rails.application.routes.draw do
  root 'dashboard#index'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources  :users, only: [:index, :show] do
    resources :debts, only: [:create]
  end
end
