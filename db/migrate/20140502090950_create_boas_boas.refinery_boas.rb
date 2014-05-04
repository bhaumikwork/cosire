# This migration comes from refinery_boas (originally 1)
class CreateBoasBoas < ActiveRecord::Migration

  def up
    create_table :refinery_boas do |t|
      t.string :name
      t.string :designation
      t.integer :profile_id
      t.text :about
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-boas"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/boas/boas"})
    end

    drop_table :refinery_boas

  end

end
