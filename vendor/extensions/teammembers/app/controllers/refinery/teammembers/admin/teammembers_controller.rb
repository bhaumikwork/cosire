module Refinery
  module Teammembers
    module Admin
      class TeammembersController < ::Refinery::AdminController

        crudify :'refinery/teammembers/teammember',
                :title_attribute => 'name',
                :xhr_paging => true

      end
    end
  end
end
