# This migration comes from refinery_interactions (originally 1)
class CreateInteractionsInteractions < ActiveRecord::Migration

  def up
    create_table :refinery_interactions do |t|
      t.string :title
      t.integer :hover_image_id
      t.integer :profile_id
      t.text :description
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-interactions"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/interactions/interactions"})
    end

    drop_table :refinery_interactions

  end

end
