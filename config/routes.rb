Rails.application.routes.draw do

  devise_for :customers
  devise_for :admins, path: 'admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    root to: 'homes#top'
    resources :items, except:[:destroy]
    resources :genres, only:[:index, :create, :edit, :update]
    resources :customers, only:[:index, :show, :edit, :update]
    resources :orders, only:[:edit, :update]
    resources :order_details, only:[:update]
  end

  scope module: :public do
    get '/' => 'homes#top'
    resources :items, only:[:index, :show]
    resources :customers, only:[:show, :edit, :update]
    get '/customers/unsubscribe' => 'customers#unsubscribe'
    patch '/customers/withdraw' => 'customers#withdraw'
    resources :cart_items, only:[:index, :update, :create, :destroy]
    delete '/cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :orders, only:[:new, :index, :show, :create]
    post '/orders/confirm' => 'orders#confirm'
    get '/orders/complete' => 'orders#complete'
    resources :addresses, except:[:show, :new]
  end


end
