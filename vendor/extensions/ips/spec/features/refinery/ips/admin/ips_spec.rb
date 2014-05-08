# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Ips" do
    describe "Admin" do
      describe "ips" do
        refinery_login_with :refinery_user

        describe "ips list" do
          before do
            FactoryGirl.create(:ip, :title => "UniqueTitleOne")
            FactoryGirl.create(:ip, :title => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.ips_admin_ips_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.ips_admin_ips_path

            click_link "Add New Ip"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Title", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Ips::Ip.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Title can't be blank")
              Refinery::Ips::Ip.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:ip, :title => "UniqueTitle") }

            it "should fail" do
              visit refinery.ips_admin_ips_path

              click_link "Add New Ip"

              fill_in "Title", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Ips::Ip.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:ip, :title => "A title") }

          it "should succeed" do
            visit refinery.ips_admin_ips_path

            within ".actions" do
              click_link "Edit this ip"
            end

            fill_in "Title", :with => "A different title"
            click_button "Save"

            page.should have_content("'A different title' was successfully updated.")
            page.should have_no_content("A title")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:ip, :title => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.ips_admin_ips_path

            click_link "Remove this ip forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Ips::Ip.count.should == 0
          end
        end

      end
    end
  end
end
