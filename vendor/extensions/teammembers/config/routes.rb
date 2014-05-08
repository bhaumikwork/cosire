Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :teammembers do
    resources :teammembers, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :teammembers, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :teammembers, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
