module Refinery
  module Strategies
    module Admin
      class StrategiesController < ::Refinery::AdminController

        crudify :'refinery/strategies/strategy',
                :title_attribute => 'name',
                :xhr_paging => true

      end
    end
  end
end
