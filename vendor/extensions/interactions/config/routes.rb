Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :interactions do
    resources :interactions, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :interactions, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :interactions, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
