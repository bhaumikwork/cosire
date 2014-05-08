module Refinery
  module Spaces
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Spaces

      engine_name :refinery_spaces

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "spaces"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.spaces_admin_spaces_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/spaces/space'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Spaces)
      end
    end
  end
end
