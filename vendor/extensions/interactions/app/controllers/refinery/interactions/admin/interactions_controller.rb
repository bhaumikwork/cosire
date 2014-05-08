module Refinery
  module Interactions
    module Admin
      class InteractionsController < ::Refinery::AdminController

        crudify :'refinery/interactions/interaction',
                :xhr_paging => true

      end
    end
  end
end
