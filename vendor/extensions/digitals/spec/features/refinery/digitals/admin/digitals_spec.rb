# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Digitals" do
    describe "Admin" do
      describe "digitals" do
        refinery_login_with :refinery_user

        describe "digitals list" do
          before do
            FactoryGirl.create(:digital, :name => "UniqueTitleOne")
            FactoryGirl.create(:digital, :name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.digitals_admin_digitals_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.digitals_admin_digitals_path

            click_link "Add New Digital"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Name", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Digitals::Digital.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Name can't be blank")
              Refinery::Digitals::Digital.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:digital, :name => "UniqueTitle") }

            it "should fail" do
              visit refinery.digitals_admin_digitals_path

              click_link "Add New Digital"

              fill_in "Name", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Digitals::Digital.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:digital, :name => "A name") }

          it "should succeed" do
            visit refinery.digitals_admin_digitals_path

            within ".actions" do
              click_link "Edit this digital"
            end

            fill_in "Name", :with => "A different name"
            click_button "Save"

            page.should have_content("'A different name' was successfully updated.")
            page.should have_no_content("A name")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:digital, :name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.digitals_admin_digitals_path

            click_link "Remove this digital forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Digitals::Digital.count.should == 0
          end
        end

      end
    end
  end
end
