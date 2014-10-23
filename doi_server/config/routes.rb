Rails.application.routes.draw do

  resources :dois do
    resources :urls, shallow: true
  end

  root 'dois#index'

end
