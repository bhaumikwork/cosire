# This migration comes from refinery_packages (originally 1)
class CreatePackagesPackages < ActiveRecord::Migration

  def up
    create_table :refinery_packages do |t|
      t.string :name
      t.integer :profile_id
      t.text :description
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-packages"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/packages/packages"})
    end

    drop_table :refinery_packages

  end

end
