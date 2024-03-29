# This migration comes from refinery_projects (originally 1)
class CreateProjectsProjects < ActiveRecord::Migration

  def up
    create_table :refinery_projects do |t|
      t.string :title
      t.integer :hover_image_id
      t.integer :profile_id
      t.string :work_category
      t.string :service_category
      t.text :description
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-projects"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/projects/projects"})
    end

    drop_table :refinery_projects

  end

end
