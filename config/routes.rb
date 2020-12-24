Rails.application.routes.draw do
  get 'recipe_images/create'

# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  root to: "books#index"
  get 'books/index'
  get "show_img" => "recipes#add_images_recipe"
  post "/recipes/1" => "recipes#show"

  resources :users do
    resources :books
  end

  resources :books do
    resources :recipes
  end

  resources :recipes do
    resources :recipe_images
  end
end


 
  
  