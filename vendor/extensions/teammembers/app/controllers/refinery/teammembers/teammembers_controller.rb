module Refinery
  module Teammembers
    class TeammembersController < ::ApplicationController

      before_filter :find_all_teammembers
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @teammember in the line below:
        present(@page)
      end

      def show
        @teammember = Teammember.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @teammember in the line below:
        present(@page)
      end

    protected

      def find_all_teammembers
        @teammembers = Teammember.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/teammembers").first
      end

    end
  end
end
