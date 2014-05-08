Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :industries do
    resources :industries, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :industries, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :industries, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
