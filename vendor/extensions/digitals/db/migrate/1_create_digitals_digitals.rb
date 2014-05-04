class CreateDigitalsDigitals < ActiveRecord::Migration

  def up
    create_table :refinery_digitals do |t|
      t.string :name
      t.integer :profile_id
      t.text :description
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-digitals"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/digitals/digitals"})
    end

    drop_table :refinery_digitals

  end

end
