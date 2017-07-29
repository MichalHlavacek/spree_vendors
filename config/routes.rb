Spree::Core::Engine.add_routes do
  namespace :admin do
    resources :vendors do
      resources :payments
    end
  end
end

