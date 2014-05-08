module Refinery
  module Startups
    class StartupsController < ::ApplicationController

      before_filter :find_all_startups
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @startup in the line below:
        present(@page)
      end

      def show
        @startup = Startup.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @startup in the line below:
        present(@page)
      end

    protected

      def find_all_startups
        @startups = Startup.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/startups").first
      end

    end
  end
end
