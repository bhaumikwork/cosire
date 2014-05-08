# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Spaces" do
    describe "Admin" do
      describe "spaces" do
        refinery_login_with :refinery_user

        describe "spaces list" do
          before do
            FactoryGirl.create(:space, :title => "UniqueTitleOne")
            FactoryGirl.create(:space, :title => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.spaces_admin_spaces_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.spaces_admin_spaces_path

            click_link "Add New Space"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Title", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Spaces::Space.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Title can't be blank")
              Refinery::Spaces::Space.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:space, :title => "UniqueTitle") }

            it "should fail" do
              visit refinery.spaces_admin_spaces_path

              click_link "Add New Space"

              fill_in "Title", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Spaces::Space.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:space, :title => "A title") }

          it "should succeed" do
            visit refinery.spaces_admin_spaces_path

            within ".actions" do
              click_link "Edit this space"
            end

            fill_in "Title", :with => "A different title"
            click_button "Save"

            page.should have_content("'A different title' was successfully updated.")
            page.should have_no_content("A title")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:space, :title => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.spaces_admin_spaces_path

            click_link "Remove this space forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Spaces::Space.count.should == 0
          end
        end

      end
    end
  end
end
