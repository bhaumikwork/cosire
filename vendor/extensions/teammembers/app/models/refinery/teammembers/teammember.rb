module Refinery
  module Teammembers
    class Teammember < Refinery::Core::BaseModel
      self.table_name = 'refinery_teammembers'

      attr_accessible :name, :designation, :hover_image_id, :profile_id, :description, :position

      validates :name, :presence => true, :uniqueness => true

      belongs_to :hover_image, :class_name => '::Refinery::Image'

      belongs_to :profile, :class_name => '::Refinery::Image'
    end
  end
end
