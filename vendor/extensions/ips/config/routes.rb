Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :ips do
    resources :ips, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :ips, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :ips, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
