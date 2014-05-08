module Refinery
  module Brands
    module Admin
      class BrandsController < ::Refinery::AdminController

        crudify :'refinery/brands/brand',
                :xhr_paging => true

      end
    end
  end
end
