class Embeder
	require 'embedly'
	require 'json'

	embedly_api
	@url

	def initialize(url='www.leekspin.com')
		@url = url
		######## adds the user 
			embedly_api = 
				Embedly::API.new :key => EMBEDLY_API_PW, :user_agent => "Mozilla/5.0 (compatible; "+ EMBEDLY_API_APP +";" + EMBEDLy_API_USER + ")"
	end


	def getBasics()
		link = embedly_api.oembed :url => 'www.xkcd.com'
		link=link[0].marshal_dump
		title=link[:title]
		description=link[:description]
		thumbnail_url=link[:thumbnail_url]
		return title, description, thumbnail_url
	end


end
