Refinery::PagesController.class_eval do
	
	before_filter :find_all_teammembers, :find_all_boas, :find_all_blocks, :find_all_industries, :find_all_spaces, :find_all_digitals, :find_all_brands, :find_all_selfs, :find_all_products, :find_all_startups, :find_all_ips, :find_all_achievements
	
	protected
	
		def find_all_products
			@products ||= ::Refinery::Projects::Project.all
		end
	
		def find_all_industries
			@industries ||= ::Refinery::Projects::Project.where('work_category LIKE ?', '%industry%').order('position ASC')
		end
		
		def find_all_spaces
			@spaces ||= ::Refinery::Projects::Project.where('work_category LIKE ?', '%space%').order('position ASC')
		end
		
		def find_all_digitals
			@digitals ||= ::Refinery::Projects::Project.where('work_category LIKE ?', '%digital%').order('position ASC')
		end
		
		def find_all_brands
			@brands ||= ::Refinery::Projects::Project.where('work_category LIKE ?', '%brand%').order('position ASC')
		end
		
		def find_all_selfs
			@selfs ||= ::Refinery::Projects::Project.where('work_category LIKE ?', '%self%').order('position ASC')
		end
		
		
		def find_all_startups
			@startups ||= ::Refinery::Startups::Startup.order('position ASC')
		end
		
		def find_all_ips
			@ips ||= ::Refinery::Ips::Ip.order('position ASC')
		end
		
		def find_all_achievements
			@achievements ||= ::Refinery::Achievements::Achievement.order('position ASC')
		end
		
		
		def find_all_teammembers
			@teammembers ||= ::Refinery::Teammembers::Teammember.order('position ASC')
		end
		
		def find_all_boas
			@boas ||= ::Refinery::Boas::Boa.order('position ASC')
		end
		
		def find_all_blocks
			@blocks ||= ::Refinery::Blocks::Block.all 
			@count = 0
		end
		
end