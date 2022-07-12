Rails.application.routes.draw do
  resources :maps, only: %i[show]
  resources :people, only: %i[index show]
  resources :users, only: %i[new create]
  get 'static_pages/top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
