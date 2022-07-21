Rails.application.routes.draw do
  scope "(:locale)", locale: /vi|en/ do
    namespace :admin do
      root "admin_static_pages#home"
      get "/home", to: "admin_static_pages#home"
      resources :products
    end

    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
  end
end
