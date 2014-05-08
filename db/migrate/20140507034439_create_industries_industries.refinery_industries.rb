# This migration comes from refinery_industries (originally 1)
class CreateIndustriesIndustries < ActiveRecord::Migration

  def up
    create_table :refinery_industries do |t|
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
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-industries"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/industries/industries"})
    end

    drop_table :refinery_industries

  end

end
