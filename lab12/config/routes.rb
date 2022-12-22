Rails.application.routes.draw do
  root 'users#beginning'

  post '/beginning', to: 'users#beginning'
  post '/users/new', to: 'users#new'
  post '/users/entry', to: 'users#entry'
  post '/users/find', to: 'users#find'
  post '/users/create', to: 'users#create'

  get '/users/entry', to: 'users#entry'
  get '/users/new', to: 'users#new'

  get '/input', to: 'automorphic#input'
  post '/browse', to: 'automorphic#browse'
  post '/output', to: 'automorphic#output'
end
