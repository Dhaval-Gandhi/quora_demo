Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  get '/test', to: "application#test"
  
  
  root "home#index"
  
  get "/profile", to: "home#profile"
  get "/profile/question_list", to: "home#question_list"
  get "/profile/answer_list", to: "home#answer_list"
  get "/profile/user_list", to: "home#user_list"
  get "/profile/topic_list", to: "home#topic_list"

  resources :questions do
    resources :answers
    resources :user_follows, only: [:create]
    resources :topic_follows, only: [:create]
  end

end
