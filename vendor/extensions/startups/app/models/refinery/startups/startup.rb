module Refinery
  module Startups
    class Startup < Refinery::Core::BaseModel
      self.table_name = 'refinery_startups'

      attr_accessible :title, :oneliner, :profile_id, :description, :position

      validates :title, :presence => true, :uniqueness => true

      belongs_to :profile, :class_name => '::Refinery::Image'
    end
  end
end
