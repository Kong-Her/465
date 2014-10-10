Rails.application.routes.draw do
  root "home#index"
  get 'step5', to: 'home#show'
  
end
