# This migration comes from refinery_teammembers (originally 1)
class CreateTeammembersTeammembers < ActiveRecord::Migration

  def up
    create_table :refinery_teammembers do |t|
      t.string :name
      t.string :designation
      t.integer :hover_image_id
      t.integer :profile_id
      t.text :description
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-teammembers"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/teammembers/teammembers"})
    end

    drop_table :refinery_teammembers

  end

end
