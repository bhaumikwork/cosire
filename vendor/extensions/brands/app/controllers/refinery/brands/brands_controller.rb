module Refinery
  module Brands
    class BrandsController < ::ApplicationController

      before_filter :find_all_brands
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @brand in the line below:
        present(@page)
      end

      def show
        @brand = Brand.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @brand in the line below:
        present(@page)
      end

    protected

      def find_all_brands
        @brands = Brand.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/brands").first
      end

    end
  end
end
