Rails.application.routes.draw do

  resources :members, except: :show

  root "members#index"

  get "list" => "members#list"

end
