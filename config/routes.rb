Spree::Core::Engine.add_routes do
  namespace :admin do
    resources :vendors do
      get 'approve'
      resources :payments
    end
  end
end

