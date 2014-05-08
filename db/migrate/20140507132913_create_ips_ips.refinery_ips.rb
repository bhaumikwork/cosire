# This migration comes from refinery_ips (originally 1)
class CreateIpsIps < ActiveRecord::Migration

  def up
    create_table :refinery_ips do |t|
      t.string :title
      t.integer :profile_id
      t.text :description
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-ips"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/ips/ips"})
    end

    drop_table :refinery_ips

  end

end
