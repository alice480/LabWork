Rails.application.routes.draw do

  root 'automorphic#input'

  get '/input', to: 'automorphic#input'
  post '/output', to: 'automorphic#output', format: :turbo_stream
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end


