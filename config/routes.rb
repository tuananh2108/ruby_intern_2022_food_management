Rails.application.routes.draw do
  scope "(:locale)", locale: /vi|en/ do
    root "admin_static_pages#home"
    get "/home", to: "admin_static_pages#home"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"

    resources :products
  end
end
