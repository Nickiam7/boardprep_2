Rails.application.routes.draw do

  devise_for :admins
  resources :members, except: :show

  root "members#index"

  get "list" => "members#list"

end
