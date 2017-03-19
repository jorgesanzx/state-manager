Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'

  defaults format: :json do
    resources :states
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
