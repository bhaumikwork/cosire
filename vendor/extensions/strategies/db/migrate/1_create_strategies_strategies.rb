class CreateStrategiesStrategies < ActiveRecord::Migration

  def up
    create_table :refinery_strategies do |t|
      t.string :name
      t.integer :profile_id
      t.text :description
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-strategies"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/strategies/strategies"})
    end

    drop_table :refinery_strategies

  end

end
