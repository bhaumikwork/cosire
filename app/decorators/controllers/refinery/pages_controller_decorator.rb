Refinery::PagesController.class_eval do
	
before_filter :find_all_teammembers, :find_all_boas, :find_all_blocks, :find_all_industries, :find_all_spaces, :find_all_digitals, :find_all_brands, :find_all_selfs, :find_all_products, :find_all_startups, :find_all_ips, :find_all_achievements, :find_all_serviceprojects, :find_all_servicestrategies, :find_all_servicebrands, :find_all_servicepackages, :find_all_serviceuis, :find_all_servicespaces
	
	protected
	   
		def find_all_products
			@products ||= ::Refinery::Projects::Project.order('position ASC')
		end
	
		def find_all_industries
			@industries ||= ::Refinery::Projects::Project.where('work_category LIKE ?', '%product%').order('position ASC')
		end
		
		def find_all_spaces
			@spaces ||= ::Refinery::Projects::Project.where('work_category LIKE ?', '%space%').order('position ASC')
		end
		
		def find_all_digitals
			@digitals ||= ::Refinery::Projects::Project.where('work_category LIKE ?', '%digital%').order('position ASC')
		end
		
		def find_all_brands
			@brands ||= ::Refinery::Projects::Project.where('work_category LIKE ?', '%branding%').order('position ASC')
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
		
		
		def find_all_serviceprojects
			@serviceprojects ||= ::Refinery::Projects::Project.where('service_category LIKE ?', '%product%').order('position ASC').limit 4
		end
		
		def find_all_servicestrategies
			@servicestrategies ||= ::Refinery::Projects::Project.where('service_category LIKE ?', '%strategy%').order('position ASC').limit 4
		end
		
		def find_all_servicebrands
			@servicebrands ||= ::Refinery::Projects::Project.where('service_category LIKE ?', '%brand%').order('position ASC').limit 4
		end
		
		def find_all_servicepackages
			@servicepackages ||= ::Refinery::Projects::Project.where('service_category LIKE ?', '%package%').order('position ASC').limit 4
		end
		
		def find_all_serviceuis
			@serviceuis ||= ::Refinery::Projects::Project.where('service_category LIKE ?', '%digital%').order('position ASC').limit 4
		end
		
		def find_all_servicespaces
			@servicespaces ||= ::Refinery::Projects::Project.where('service_category LIKE ?', '%space%').order('position ASC').limit 4
		end
		
end