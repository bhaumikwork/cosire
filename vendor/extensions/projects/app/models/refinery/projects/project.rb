module Refinery
  module Projects
    class Project < Refinery::Core::BaseModel
      self.table_name = 'refinery_projects'

      attr_accessible :title, :hover_image_id, :profile_id, :work_category, :service_category, :description, :position

      validates :title, :presence => true, :uniqueness => true

      belongs_to :hover_image, :class_name => '::Refinery::Image'

      belongs_to :profile, :class_name => '::Refinery::Image'
    end
  end
end
