require 'spec_helper'

module Refinery
  module Digitals
    describe Digital do
      describe "validations" do
        subject do
          FactoryGirl.create(:digital,
          :name => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:name) { should == "Refinery CMS" }
      end
    end
  end
end
