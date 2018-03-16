Rails.application.routes.draw do
  root 'dashboard#index'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources  :users, only: [:index, :show] do
    get '/history',        to: 'debts#history'
    post '/',              to: 'debts#create',         as: 'create_debt'
    put '/cover/:debt_id', to: 'debts#set_as_covered', as: 'cover'
  end
end
