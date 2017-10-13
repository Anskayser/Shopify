Rails.application.routes.draw do
  devise_for :users, controllers: {:registrations =>"registrations" ,:sessions =>"sessions" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html\
root 'welcome#index'
resources :welcome
resources :home
resources :charges, only: [:new, :create]
resources :cards do
		member do
			get 'createcharge'
			end
		end
resources :orders do
  member do
    get 'cart'
     get 'showcart'
     get 'totalAmount'
  end
  
end

# resource :admin


namespace :admin do
	root '/admin/home#index'
	resources :users do 
		collection do
			get :signout
		end
	end
	resources :categories
	resources :subcategories
	resources :products


end




end
