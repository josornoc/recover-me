Rails.application.routes.draw do

  root 'site#index'

  post '/login' => 'login#create'
  delete '/logout' => 'login#destroy'
  get '/register' => 'registration#new'
  post '/register' => 'registration#create'
  get '/search' => 'site#search'

  resources :items do
    get '/report' => 'items#report'
  	post '/relations' => 'relations#create'
    post '/questions' => 'questions#create'
  	get '/relations/:id' => 'relations#authenticate', as: "relation"
    post '/relations/:id' => 'relations#answer', as: "answer"
    patch '/questions/:id' => 'questions#validate_answer', as: "question"
  end

end
