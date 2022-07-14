Rails.application.routes.draw do
  resources :maps, only: %i[show]
  resources :people, only: %i[index show]
  resources :users, only: %i[new create]
  get 'static_pages/top'
  get 'login' => 'user_sessions#new'
  post 'login' => 'user_sessions#create'
  delete 'logout' => 'user_sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
