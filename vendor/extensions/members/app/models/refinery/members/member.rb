module Refinery
  module Members
    class Member < Refinery::Core::BaseModel
      self.table_name = 'refinery_members'

      attr_accessible :name, :designation, :profile_id, :about, :position

      validates :name, :presence => true, :uniqueness => true

      belongs_to :profile, :class_name => '::Refinery::Image'
    end
  end
end
