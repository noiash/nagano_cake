Rails.application.routes.draw do
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    get '/' => 'homes#top'
    resources :items
  end

  namespace :public do
    get '/' => 'homes#top'
  end


end
