class CreateSpacesSpaces < ActiveRecord::Migration

  def up
    create_table :refinery_spaces do |t|
      t.string :name
      t.integer :profile_id
      t.text :description
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-spaces"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/spaces/spaces"})
    end

    drop_table :refinery_spaces

  end

end
