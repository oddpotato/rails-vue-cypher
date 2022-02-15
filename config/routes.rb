Rails.application.routes.draw do
  get 'signin/create'
  # get 'signup/create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  namespace :api do
    namespace :v1 do
      resources :messages
    end
  end

  root to: "home#index"

end
