module Refinery
  module Packages
    class Package < Refinery::Core::BaseModel
      self.table_name = 'refinery_packages'

      attr_accessible :name, :profile_id, :description, :position

      validates :name, :presence => true, :uniqueness => true

      belongs_to :profile, :class_name => '::Refinery::Image'
    end
  end
end
