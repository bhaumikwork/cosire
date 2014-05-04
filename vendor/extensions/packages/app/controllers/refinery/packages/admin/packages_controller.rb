module Refinery
  module Packages
    module Admin
      class PackagesController < ::Refinery::AdminController

        crudify :'refinery/packages/package',
                :title_attribute => 'name',
                :xhr_paging => true

      end
    end
  end
end
