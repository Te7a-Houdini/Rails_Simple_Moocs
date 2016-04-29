Rails.application.routes.draw do
  get 'lectures/new'

  get 'lectures/create'

  get 'lectures/show'

  get 'lectures/update'

  get 'lectures/edit'

  get 'lectures/destroy'

  get 'lectures/show_lectures/:course_id' => 'lectures#show_course_lectures'

  post 'like/:lecture_id' => 'lectures#like'
  post 'unlike/:lecture_id' => 'lectures#unlike'
  post 'spam/:lecture_id' => 'lectures#spam'
  post 'unspam/:lecture_id' => 'lectures#unspam'

  mount Ckeditor::Engine => '/ckeditor'
  get 'courses/index'

  get 'courses/new'

  get 'courses/create'

  get 'home/index'


  devise_for :users, controllers: { sessions: "users/sessions" , registrations: "users/registrations" }
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'home#index'
    resources :courses
  resources :lectures
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
