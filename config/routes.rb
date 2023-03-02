Rails.application.routes.draw do
  resources :weather, only: [:index, :create,]
  root 'weather#index'
  get 'weather/show' => "weather#show"
  resources :city, only: [:create]
end
