module Refinery
  module Boas
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Boas

      engine_name :refinery_boas

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "boas"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.boas_admin_boas_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/boas/boa',
            :title => 'name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Boas)
      end
    end
  end
end
