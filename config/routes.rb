Rails.application.routes.draw do
  namespace :api do
    resources :teams
  end
end
