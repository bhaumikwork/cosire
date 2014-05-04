Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :strategies do
    resources :strategies, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :strategies, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :strategies, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
