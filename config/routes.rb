Rails.application.routes.draw do
  root 'site#index'
  post '/login' => 'login#create'
  delete '/logout' => 'login#destroy'
  get '/register' => 'registration#new'
  post '/register' => 'registration#create'
  resources :items do
  	post '/relations' => 'relations#create'
  end
end
