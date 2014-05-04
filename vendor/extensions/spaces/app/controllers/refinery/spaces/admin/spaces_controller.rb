module Refinery
  module Spaces
    module Admin
      class SpacesController < ::Refinery::AdminController

        crudify :'refinery/spaces/space',
                :title_attribute => 'name',
                :xhr_paging => true

      end
    end
  end
end
