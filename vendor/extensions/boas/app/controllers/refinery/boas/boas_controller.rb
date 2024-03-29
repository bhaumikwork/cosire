module Refinery
  module Boas
    class BoasController < ::ApplicationController

      before_filter :find_all_boas
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @boa in the line below:
        present(@page)
      end

      def show
        @boa = Boa.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @boa in the line below:
        present(@page)
      end

    protected

      def find_all_boas
        @boas = Boa.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/boas").first
      end

    end
  end
end
