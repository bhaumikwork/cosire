module Refinery
  module Strategies
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Strategies

      engine_name :refinery_strategies

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "strategies"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.strategies_admin_strategies_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/strategies/strategy',
            :title => 'name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Strategies)
      end
    end
  end
end
