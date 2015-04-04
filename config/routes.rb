Rails.application.routes.draw do

  patch "capture", to: "pokemons#capture"
  patch "damage", to: "pokemons#damage"
  get "pokemons/new", to: "pokemons#new"
  post "pokemons/new", to: "pokemons#new"
  post "pokemons", to: "pokemons#create"

  root :to => 'home#index'
  devise_for :trainers
  resources :trainers

end
