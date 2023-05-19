Rails.application.routes.draw do
  get 'sessions/new'
  # get 'session/new'
  
  # GET / static_pages#home
  root "static_pages#home"

  # URL と アクションが密結合になっている。
  # GET /static_pages => static_pages(controler)#home(action)
  # GET /about => static_pages#about にしていく
  # get  "static_pages/home"
  # get  "static_pages/help"
  # get  "static_pages/about"
  # get  "static_pages/contact"
  # get  "users/new"

  get  "/help",     to: "static_pages#help"
  get  "/about",    to: "static_pages#about"
  get  "/contact",  to: "static_pages#contact"
  get  "/signup",   to: "users#new"
  get    "/login",  to: "sessions#new"
  post   "/login",  to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :users
end
