Rails.application.routes.draw do

  mount StripeEvent::Engine, at: "stripe"

  get 'episodes/show'
  get 'episodes/create'
  get 'episodes/new'
  get 'episodes/update'
  get 'episodes/destroy'
  get 'episodes/edit'
  get 'charges/:id', to: 'charges#show'

  root to: 'episodes#index'

  devise_for :users
  resources :users

  resources :episodes
  resource :subscription
  resource :card

end
