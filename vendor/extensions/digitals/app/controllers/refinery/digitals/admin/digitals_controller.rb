module Refinery
  module Digitals
    module Admin
      class DigitalsController < ::Refinery::AdminController

        crudify :'refinery/digitals/digital',
                :title_attribute => 'name',
                :xhr_paging => true

      end
    end
  end
end
