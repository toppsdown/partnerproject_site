class Embedder
	require 'embedly'
	require 'json'

	@embedly_api
	@url

	def initialize(url='www.leekspin.com')
		@url = url
		######## adds the user 
			embedly_api = 
				Embedly::API.new :key => EMBEDLY_API_PW, :user_agent => "Mozilla/5.0 (compatible;  #{EMBEDLY_API_APP};  #{EMBEDLy_API_USER} )"
	end


	def getBasics()
		embeded_object = embedly_api.oembed :url => 'www.xkcd.com'
		embeded_object=embeded_object[0].marshal_dump
		title=embeded_object[:title]
		description=embeded_object[:description]
		thumbnail_url=embeded_object[:thumbnail_url]
		return title, description, thumbnail_url
	end


end
