module Refinery
  module Interactions
    class InteractionsController < ::ApplicationController

      before_filter :find_all_interactions
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @interaction in the line below:
        present(@page)
      end

      def show
        @interaction = Interaction.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @interaction in the line below:
        present(@page)
      end

    protected

      def find_all_interactions
        @interactions = Interaction.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/interactions").first
      end

    end
  end
end
