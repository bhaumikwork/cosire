# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Startups" do
    describe "Admin" do
      describe "startups" do
        refinery_login_with :refinery_user

        describe "startups list" do
          before do
            FactoryGirl.create(:startup, :title => "UniqueTitleOne")
            FactoryGirl.create(:startup, :title => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.startups_admin_startups_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.startups_admin_startups_path

            click_link "Add New Startup"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Title", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Startups::Startup.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Title can't be blank")
              Refinery::Startups::Startup.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:startup, :title => "UniqueTitle") }

            it "should fail" do
              visit refinery.startups_admin_startups_path

              click_link "Add New Startup"

              fill_in "Title", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Startups::Startup.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:startup, :title => "A title") }

          it "should succeed" do
            visit refinery.startups_admin_startups_path

            within ".actions" do
              click_link "Edit this startup"
            end

            fill_in "Title", :with => "A different title"
            click_button "Save"

            page.should have_content("'A different title' was successfully updated.")
            page.should have_no_content("A title")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:startup, :title => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.startups_admin_startups_path

            click_link "Remove this startup forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Startups::Startup.count.should == 0
          end
        end

      end
    end
  end
end
