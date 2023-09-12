Rails.application.routes.draw do
  get 'articles/index'
  get 'articles/show'
  get 'articles/destroy'
  get 'articles/create'
  get 'articles/update'
  root "tops#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
