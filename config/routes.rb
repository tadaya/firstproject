Projectone::Application.routes.draw do
  resources :places

  resources :users do
    resources :places
  end


  get "/login", to: "session#new"
  post "/session", to: "session#create"
  delete "/session", to: "session#destroy"

  root "welcome#index"


end
