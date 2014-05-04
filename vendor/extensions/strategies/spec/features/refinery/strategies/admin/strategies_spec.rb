# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Strategies" do
    describe "Admin" do
      describe "strategies" do
        refinery_login_with :refinery_user

        describe "strategies list" do
          before do
            FactoryGirl.create(:strategy, :name => "UniqueTitleOne")
            FactoryGirl.create(:strategy, :name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.strategies_admin_strategies_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.strategies_admin_strategies_path

            click_link "Add New Strategy"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Name", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Strategies::Strategy.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Name can't be blank")
              Refinery::Strategies::Strategy.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:strategy, :name => "UniqueTitle") }

            it "should fail" do
              visit refinery.strategies_admin_strategies_path

              click_link "Add New Strategy"

              fill_in "Name", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Strategies::Strategy.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:strategy, :name => "A name") }

          it "should succeed" do
            visit refinery.strategies_admin_strategies_path

            within ".actions" do
              click_link "Edit this strategy"
            end

            fill_in "Name", :with => "A different name"
            click_button "Save"

            page.should have_content("'A different name' was successfully updated.")
            page.should have_no_content("A name")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:strategy, :name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.strategies_admin_strategies_path

            click_link "Remove this strategy forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Strategies::Strategy.count.should == 0
          end
        end

      end
    end
  end
end
