module Refinery
  module Packages
    class PackagesController < ::ApplicationController

      before_filter :find_all_packages
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @package in the line below:
        present(@page)
      end

      def show
        @package = Package.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @package in the line below:
        present(@page)
      end

    protected

      def find_all_packages
        @packages = Package.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/packages").first
      end

    end
  end
end
