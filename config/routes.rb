Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "admin_static_pages#home"
    get "/home", to: "admin_static_pages#home"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
  end
end
