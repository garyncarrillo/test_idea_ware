Rails.application.routes.draw do
  resources :favourites, only: %i(index new create destroy)

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
