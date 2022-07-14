Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    get "admin_static_pages/home"
  end
end
