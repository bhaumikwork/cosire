Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :digitals do
    resources :digitals, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :digitals, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :digitals, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
