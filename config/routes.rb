Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :trips, only: [:index, :new, :create, :show] do
    resources :invites, only: [:new, :create]
    patch '/invites/:id', to: 'invites#accept', as: :invite
  #   patch '/trips/:trip_id/invites/:id', to: 'invites#accept'
    resources :propositions, only: [:new, :create, :show, :destroy]
  end
  patch '/propositions/:id', to: 'propositions#validate', as: :validate
  resources :invites, only: [:index]
  # patch '/propositions/:id/dismiss', to: 'propositions#dismiss'
  resources :propositions, only: [:edit ] do
    resources :votes, only: [:new, :create]
    member do
      get :validate
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
