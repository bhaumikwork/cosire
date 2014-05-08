module Refinery
  module Teammembers
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Teammembers

      engine_name :refinery_teammembers

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "teammembers"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.teammembers_admin_teammembers_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/teammembers/teammember',
            :title => 'name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Teammembers)
      end
    end
  end
end
