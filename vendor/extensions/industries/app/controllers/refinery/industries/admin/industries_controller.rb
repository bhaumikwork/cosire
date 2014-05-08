module Refinery
  module Industries
    module Admin
      class IndustriesController < ::Refinery::AdminController

        crudify :'refinery/industries/industry',
                :xhr_paging => true

      end
    end
  end
end
