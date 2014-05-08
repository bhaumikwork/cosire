module Refinery
  module Startups
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Startups

      engine_name :refinery_startups

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "startups"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.startups_admin_startups_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/startups/startup'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Startups)
      end
    end
  end
end
