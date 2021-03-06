Rails.application.routes.draw do
  
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

  resources :restaurants do
    collection do
      get 'search'
    end
    resources :reviews, except: [:show, :index]
	member do
		put "like", to: "restaurants#upvote"
		put "dislike", to: "restaurants#downvote"
	end
    resources :restaurantimages
  end

  resources :street_foods do
    collection do
      get 'search'
    end
    resources :reviews, expect: [:show, :index]
  member do
    put "like", to: "street_foods#upvote"
    put "dislike", to: "street_foods#downvote"
  end
  end
  
  resources :bars do
    collection do
      get 'search'
    end
    resources :reviews, except: [:show, :index]
        member do
                put "like", to: "bars#upvote"
                put "dislike", to: "bars#downvote"
        end
  end

  post '/search/:query' => 'search#index'

  resources :places do
	collection do
		get 'search'
	end
	resources :reviews, expect: [:show, :index]
	member do
		put "like", to: "places#upvote"
		put "dislike", to: "places#downvote"
	end
end
  
  resources :touristspots do
	collection do
		get 'search'
	end
	resources :reviews, except: [:show, :index]
	member do
		put "like", to: "touristspots#upvote"
		put "dislike", to: "touristspots#downvote"
	end
	end

  resources :pubs do
    collection do
      get 'search'
    end
    resources :reviews, except: [:show, :index]
        member do
                put "like", to: "pubs#upvote"
                put "dislike", to: "pubs#downvote"
        end
  end

  resources :weekends do
    collection do
      get 'search'
    end
    resources :reviews, except: [:show, :index]
	member do
		put "like", to: "weekends#upvote"
		put "dislike", to: "weekends#downvote"
	end
  end

  get 'welcome/index'

  get 'pages/about'

  get 'pages/contact'
  get 'search' => 'search#index'


  root 'welcome#index'

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
