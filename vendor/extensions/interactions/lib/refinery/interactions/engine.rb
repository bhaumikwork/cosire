module Refinery
  module Interactions
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Interactions

      engine_name :refinery_interactions

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "interactions"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.interactions_admin_interactions_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/interactions/interaction'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Interactions)
      end
    end
  end
end
