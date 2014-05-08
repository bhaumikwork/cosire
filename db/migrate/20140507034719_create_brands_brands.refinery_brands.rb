# This migration comes from refinery_brands (originally 1)
class CreateBrandsBrands < ActiveRecord::Migration

  def up
    create_table :refinery_brands do |t|
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
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-brands"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/brands/brands"})
    end

    drop_table :refinery_brands

  end

end