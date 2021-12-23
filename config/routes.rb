Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

    resource :users, only: [:create]
    post "/login", to: "users#login"
    get "/auto_login", to: "users#auto_login"

    post "/chat/send", to: "chats#create"
    get "/chat/show", to: "chats#index"
  

end
