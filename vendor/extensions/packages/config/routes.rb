Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :packages do
    resources :packages, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :packages, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :packages, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
