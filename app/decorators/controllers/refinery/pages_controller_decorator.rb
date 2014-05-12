Refinery::PagesController.class_eval do
	
	before_filter :find_all_industries, :find_all_spaces, :find_all_interactions, :find_all_brands, :find_all_teammembers, :find_all_boas, :find_all_blocks
	
	protected
	
		def find_all_industries
			@industries ||= ::Refinery::Industries::Industry.all
		end
		
		def find_all_spaces
			@spaces ||= ::Refinery::Spaces::Space.all
		end
		
		def find_all_interactions
			@interactions ||= ::Refinery::Interactions::Interaction.all
		end
		
		def find_all_brands
			@brands ||= ::Refinery::Brands::Brand.all
		end
		
		def find_all_teammembers
			@teammembers ||= ::Refinery::Teammembers::Teammember.all
		end
		
		def find_all_boas
			@boas ||= ::Refinery::Boas::Boa.all
		end
		
		def find_all_blocks
			@blocks ||= ::Refinery::Blocks::Block.all 
			@count = 0
		end
		
end