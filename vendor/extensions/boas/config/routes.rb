Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :boas do
    resources :boas, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :boas, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :boas, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
