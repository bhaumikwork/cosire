# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Industries" do
    describe "Admin" do
      describe "industries" do
        refinery_login_with :refinery_user

        describe "industries list" do
          before do
            FactoryGirl.create(:industry, :title => "UniqueTitleOne")
            FactoryGirl.create(:industry, :title => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.industries_admin_industries_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.industries_admin_industries_path

            click_link "Add New Industry"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Title", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Industries::Industry.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Title can't be blank")
              Refinery::Industries::Industry.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:industry, :title => "UniqueTitle") }

            it "should fail" do
              visit refinery.industries_admin_industries_path

              click_link "Add New Industry"

              fill_in "Title", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Industries::Industry.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:industry, :title => "A title") }

          it "should succeed" do
            visit refinery.industries_admin_industries_path

            within ".actions" do
              click_link "Edit this industry"
            end

            fill_in "Title", :with => "A different title"
            click_button "Save"

            page.should have_content("'A different title' was successfully updated.")
            page.should have_no_content("A title")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:industry, :title => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.industries_admin_industries_path

            click_link "Remove this industry forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Industries::Industry.count.should == 0
          end
        end

      end
    end
  end
end
