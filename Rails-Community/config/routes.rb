Rails.application.routes.draw do


resources :posts

root 'top#index'
end