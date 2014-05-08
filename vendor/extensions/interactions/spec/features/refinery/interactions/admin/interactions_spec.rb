# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Interactions" do
    describe "Admin" do
      describe "interactions" do
        refinery_login_with :refinery_user

        describe "interactions list" do
          before do
            FactoryGirl.create(:interaction, :title => "UniqueTitleOne")
            FactoryGirl.create(:interaction, :title => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.interactions_admin_interactions_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.interactions_admin_interactions_path

            click_link "Add New Interaction"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Title", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Interactions::Interaction.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Title can't be blank")
              Refinery::Interactions::Interaction.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:interaction, :title => "UniqueTitle") }

            it "should fail" do
              visit refinery.interactions_admin_interactions_path

              click_link "Add New Interaction"

              fill_in "Title", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Interactions::Interaction.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:interaction, :title => "A title") }

          it "should succeed" do
            visit refinery.interactions_admin_interactions_path

            within ".actions" do
              click_link "Edit this interaction"
            end

            fill_in "Title", :with => "A different title"
            click_button "Save"

            page.should have_content("'A different title' was successfully updated.")
            page.should have_no_content("A title")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:interaction, :title => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.interactions_admin_interactions_path

            click_link "Remove this interaction forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Interactions::Interaction.count.should == 0
          end
        end

      end
    end
  end
end
