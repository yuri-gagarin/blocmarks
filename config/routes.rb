Rails.application.routes.draw do



  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "welcome#index"
  resources :topics do
    resources :bookmarks, except: [:index]
  end
  get "/bookmarks", to: "bookmarks#index", as: "user_bookmarks"
  get "/likes/new", to: "likes#new", as: "new_like"
  post "/likes", to: "likes#create", as: "create_like"
end
