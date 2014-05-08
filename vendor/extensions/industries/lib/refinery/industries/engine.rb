module Refinery
  module Industries
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Industries

      engine_name :refinery_industries

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "industries"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.industries_admin_industries_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/industries/industry'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Industries)
      end
    end
  end
end
