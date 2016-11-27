Rails.application.routes.draw do

  resources :msponsors
  resources :mstats
  resources :madvisors
  resources :mratings
  resources :mdetails
  resources :mobjects
  resources :mcategories
  resources :mcalendars
  resources :user_positions
  get 'customer_advisor/index'
  get 'customer_advisor/index2'
  
  get 'listaccounts/index'

  get 'statement/index'

  resources :transactions
  resources :accounts
  resources :emails
  resources :appointment_documents
  resources :service_documents
  resources :appointments
  resources :partner_links
  get 'ticketuserview/index'
  get 'ticketuserview/index2'
  get 'users/ticketstatus'

  resources :user_tickets
  resources :tickets
  resources :customers
  get 'showcal/mobject'
  get 'showcal/action'

  get 'showcal/bid'

  get 'showcal/event'

  resources :hs_ratings
  resources :favourits
  get 'ticker/index'

  resources :appparams
  get 'offer/index'
  get 'home/index2'
  get 'home/index3'
  get 'home/index4'
  get 'home/index5'
  get 'home/index6'  
  get 'home/index7'  
  get 'home/index8'  
  resources :webmasters
  devise_for :users, :controllers => {registrations: 'registrations'}

  resources :companies
  resources :users
  resources :searches
  resources :calenders
  resources :ratings
  resources :searches

  root 'home#index3'
  get 'admin/sendmail'
  get 'admin/showmap'
  get 'home/index'
  post 'home/index'
  get 'home/dashboard'
  post 'home/dashboard'
  get 'users/index' 
  get 'users/workorder'
  get 'companies/search'
  
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
