module Refinery
  module Ips
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Ips

      engine_name :refinery_ips

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "ips"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.ips_admin_ips_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/ips/ip'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Ips)
      end
    end
  end
end
