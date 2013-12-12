
module SharesHelper
	require("#{Rails.root}/app/classes/embedder.rb")
	include Embedder

	def embedify(link)
    	siteinfo = getBasics(link.url) 
      	link.title = siteinfo[0]
      	link.description = siteinfo[1]
      	link.img_url= siteinfo[2]
      	return link
	end

end
