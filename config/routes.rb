Rails.application.routes.draw do
  resources :matches

  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"},
                     controllers: {
                        omniauth_callbacks: "omniauth_callbacks",
                        registrations: "users/registrations"
                     }
  as :user do
    # get 'signin' => 'devise/sessions#new', :as => :new_user_session
    # post 'signin' => 'devise/sessions#create', :as => :user_session
    # delete 'signout' => 'devise/sessions#destroy', :as => :destroy_user_session
  end
  resources :users

  shallow do
    resources :leagues do
      resources :users
    end
  end

  resources :leagues do
    resources :seasons
  end


  resource :matches

  get '/users/auth/:provider/callback', to: 'users_ominauth_callbacks#create'

  get '/logout', to: 'sessions#destroy', as: 'signout'

  get 'rankings' => 'rankings#index'

  root to: 'rankings#index'


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
