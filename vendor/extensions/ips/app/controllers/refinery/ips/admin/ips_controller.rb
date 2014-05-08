module Refinery
  module Ips
    module Admin
      class IpsController < ::Refinery::AdminController

        crudify :'refinery/ips/ip',
                :xhr_paging => true

      end
    end
  end
end
