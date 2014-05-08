module Refinery
  module Ips
    class IpsController < ::ApplicationController

      before_filter :find_all_ips
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @ip in the line below:
        present(@page)
      end

      def show
        @ip = Ip.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @ip in the line below:
        present(@page)
      end

    protected

      def find_all_ips
        @ips = Ip.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/ips").first
      end

    end
  end
end
