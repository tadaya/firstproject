Projectone::Application.routes.draw do
  resources :places do
    resources :taggings
  end

  resources :users 


  get "/login", to: "session#new"
  post "/session", to: "session#create"
  delete "/session", to: "session#destroy"

  root "welcome#index"


end
