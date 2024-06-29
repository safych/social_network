Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    root "home#index"

    devise_for :admins
    devise_for :users, controllers: {
      registrations: "users/registrations",
      sessions: "users/sessions",
      passwords: "users/passwords"
    }

    resource :profile, only: :show
    resources :users, only: :update
    resources :posts, except: :new  
  end
end
