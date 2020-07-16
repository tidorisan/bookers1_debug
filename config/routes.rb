Rails.application.routes.draw do
# root
  resources :books
  root to: 'home#top'
end
