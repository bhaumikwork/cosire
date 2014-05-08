module Refinery
  module Achievements
    class Achievement < Refinery::Core::BaseModel
      self.table_name = 'refinery_achievements'

      attr_accessible :title, :profile_id, :description, :position

      validates :title, :presence => true, :uniqueness => true

      belongs_to :profile, :class_name => '::Refinery::Image'
    end
  end
end
