Rails.application.routes.draw do
  get '/about', to: "static#index", as: "about"
  get '/', to: 'static#home', as: "home"
  resources :recipe_ingredients
  resources :ingredients
  resources :recipes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
