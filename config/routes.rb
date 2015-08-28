Pakuhaji::Application.routes.draw do

  get "homes_profile" => "homes#profile", :as => "profile_home"
  get "homes_fasility" => "homes#fasility", :as => "fasility_home"
  get "homes_game" => "homes#game", :as => "game_home"
  get "homes_packet" => "homes#packet", :as => "packet_home"
  get "homes_gallery" => "homes#gallery", :as => "gallery_home"
  get "homes_gallery_show/:id" => "homes#gallery_show", :as => "gallery_show_home"
  
  
  get "sign_up" => "admins#new", :as => "sign_up"
  get "login" => "admins#new", :as => "login"
 resources :sessions
 resources :admins
 resources :articles
 resources :homes
 resources :profiles
 resources :fasilities
 resources :games
 resources :packets
 resources :galleries
 resources :sliders
 resources :vacation_packets
 resources :additional_packets
 resources :reservations do
   collection do 
     get ':id/update_status' => "reservations#update_status", :as => "update_status"
     get 'search' => "reservations#search", :as => "search"
   end
 end
 resources :customers
 resources :foods
 root :to => "homes#index"
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
