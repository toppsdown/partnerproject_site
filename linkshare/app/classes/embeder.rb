class Embeder
	require 'embedly'
	require 'json'


	@url
	def initialize(url='www.leekspin.com')
		@url = url
		embedly_api =
			Embedly::API.new :user_agent => 'Mozilla/5.0 (compatible; mytestapp/1.0; my@email.com)'
		######## adds the user 
		embedly_api = Embedly::API.new :key => 'xxxxxxxxxxxxxxxxxxxxxxxxxx',

	end



end
