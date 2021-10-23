Rails.application.routes.draw do


  devise_for :admin, controllers: {
        sessions: 'admin/sessions'
      }

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
    devise_for(
    :customers,
    module: 'public/customers'
    )
    root to: 'homes#top'
    get '/about' => 'homes#about'
    resources :items, only:[:index, :show]
    get '/customers/unsubscribe' => 'customers#unsubscribe'
    patch '/customers/withdraw' => 'customers#withdraw'
    resources :customers, only:[:show, :edit, :update]
    delete '/cart_items/destroy_all' => 'cart_items#destroy_all'
    post '/orders/confirm' => 'orders#confirm'
    get '/orders/complete' => 'orders#complete'
    resources :cart_items, only:[:index, :update, :create, :destroy]
    resources :orders, only:[:new, :index, :create, :show]
    resources :addresses, except:[:show, :new]
  end


end
