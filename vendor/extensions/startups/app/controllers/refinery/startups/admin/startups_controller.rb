module Refinery
  module Startups
    module Admin
      class StartupsController < ::Refinery::AdminController

        crudify :'refinery/startups/startup',
                :xhr_paging => true

      end
    end
  end
end
