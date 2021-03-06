Rails.application.routes.draw do
    get    'sessions/new'
	root   'static_pages#home'
	get    '/about',   to: 'static_pages#about'
	get    '/contact', to: 'static_pages#contact'
	get    '/signup',  to: 'users#new'
	post   '/signup',  to: 'users#create'
	get    '/login',   to: 'sessions#new'
	post   '/login',   to: 'sessions#create'
	delete '/logout',  to: 'sessions#destroy'
	resources :users
	resources :posts, only: [:new, :create, :index]
	
end
