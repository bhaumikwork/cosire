module Refinery
  module Spaces
    module Admin
      class SpacesController < ::Refinery::AdminController

        crudify :'refinery/spaces/space',
                :xhr_paging => true

      end
    end
  end
end
