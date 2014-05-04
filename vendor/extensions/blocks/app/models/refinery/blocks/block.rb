module Refinery
  module Blocks
    class Block < Refinery::Core::BaseModel
      self.table_name = 'refinery_blocks'

      attr_accessible :name, :image1_id, :image2_id, :link, :position

      validates :name, :presence => true, :uniqueness => true

      belongs_to :image1, :class_name => '::Refinery::Image'

      belongs_to :image2, :class_name => '::Refinery::Image'
    end
  end
end
