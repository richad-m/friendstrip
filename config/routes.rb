Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :trips, only: [:index, :new, :create]
  # do
  #   resources :invites, only: [:new, :create]
  #   patch '/trips/:trip_id/invites/:id', to: 'invites#accept'
  #   resources :propositions, only: [:new, :create]
  # end
  # patch '/propositions/:id/validate', to: 'propositions#validate'
  # patch '/propositions/:id/dismiss', to: 'propositions#dismiss'
  # resources :propositions, only: [:edit ] do
  #   resources :votes, only: [:new, :create]
  #   patch '/propositions/:proposition_id/votes/:id', to: 'votes#upvote'
  #   patch '/propositions/:proposition_id/votes/:id', to: 'votes#downvote'
  # end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
