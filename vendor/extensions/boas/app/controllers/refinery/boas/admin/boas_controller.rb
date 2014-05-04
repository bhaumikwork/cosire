module Refinery
  module Boas
    module Admin
      class BoasController < ::Refinery::AdminController

        crudify :'refinery/boas/boa',
                :title_attribute => 'name',
                :xhr_paging => true

      end
    end
  end
end
