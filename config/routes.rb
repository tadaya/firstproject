Projectone::Application.routes.draw do
  resources :places do
    resources :taggings, only:[:create, :new, :show]
  end

  resources :users do 
    resources :places, only: [:index, :show]
      resources :taggings, only: [:create]
  end


  get "/login", to: "session#new"
  post "/session", to: "session#create"
  delete "/session", to: "session#destroy"

  root "welcome#index"

end
