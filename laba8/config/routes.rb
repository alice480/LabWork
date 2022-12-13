Rails.application.routes.draw do
  get 'automorphic/input'
  get 'automorphic/output'
  root 'automorphic#input'

  get '/input', to: 'automorphic#input'
  get '/output', to: 'automorphic#output'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
