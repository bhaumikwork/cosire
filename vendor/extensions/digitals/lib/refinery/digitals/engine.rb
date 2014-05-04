module Refinery
  module Digitals
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Digitals

      engine_name :refinery_digitals

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "digitals"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.digitals_admin_digitals_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/digitals/digital',
            :title => 'name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Digitals)
      end
    end
  end
end
