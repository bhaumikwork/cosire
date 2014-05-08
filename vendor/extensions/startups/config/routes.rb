Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :startups do
    resources :startups, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :startups, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :startups, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
