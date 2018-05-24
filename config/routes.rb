Rails.application.routes.draw do
  namespace :admin do
    get "/", to: "base#index"
    get "/category", to: "categories#list"
  end
end
