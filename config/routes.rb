Rails.application.routes.draw do
  # GET / static_pages#home
  root "static_pages#home"

  # URL と アクションが密結合になっている。
  # GET /static_pages => static_pages(controler)#home(action)
  # GET /about => static_pages#about にしていく
  get  "static_pages/home"
  get  "static_pages/help"
  get  "static_pages/about"
end
