class CreateBlocksBlocks < ActiveRecord::Migration

  def up
    create_table :refinery_blocks do |t|
      t.string :name
      t.integer :image1_id
      t.integer :image2_id
      t.string :link
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-blocks"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/blocks/blocks"})
    end

    drop_table :refinery_blocks

  end

end
