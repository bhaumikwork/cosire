# This migration comes from refinery_startups (originally 1)
class CreateStartupsStartups < ActiveRecord::Migration

  def up
    create_table :refinery_startups do |t|
      t.string :title
      t.string :oneliner
      t.integer :profile_id
      t.text :description
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-startups"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/startups/startups"})
    end

    drop_table :refinery_startups

  end

end
