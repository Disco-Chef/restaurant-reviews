Rails.application.routes.draw do
  # Nesting starts here  👇
  resources :restaurants do
    collection do
      # get 'top', to: "restaurants#top", as: :top_restaurant
      # restaurants/top
      get :top
    end

    # restaurants/:restaurant_id/chef
    member do
      get :chef
    end

    # new: get restaurants/:restuarant_id/reviews/new
    # create: post restaurants/:restuarant_id/reviews
    resources :reviews, only: [ :new, :create ]
  end
  #☝ `end` nesting here
  resources :reviews, only: [ :destroy ]
end
