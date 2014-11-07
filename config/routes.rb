Rails.application.routes.draw do
  get 'frog/submit'

  post 'frog/new'

  root 'frog#submit'

  resources :frog
end
