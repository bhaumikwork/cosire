module Refinery
  module Achievements
    module Admin
      class AchievementsController < ::Refinery::AdminController

        crudify :'refinery/achievements/achievement',
                :xhr_paging => true

      end
    end
  end
end
