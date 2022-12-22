Rails.application.routes.draw do
  root 'automorphic#input'

  get '/input', to: 'automorphic#input'
  post '/browse', to: 'automorphic#browse'
  post '/output', to: 'automorphic#output'
end
