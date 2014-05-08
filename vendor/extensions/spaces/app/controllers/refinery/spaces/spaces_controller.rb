module Refinery
  module Spaces
    class SpacesController < ::ApplicationController

      before_filter :find_all_spaces
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @space in the line below:
        present(@page)
      end

      def show
        @space = Space.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @space in the line below:
        present(@page)
      end

    protected

      def find_all_spaces
        @spaces = Space.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/spaces").first
      end

    end
  end
end
