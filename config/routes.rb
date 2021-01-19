Rails.application.routes.draw do
  resources :competitions, only: [:index, :show] do
    resources :competition_teams, only: [:new, :create]
  end
end
