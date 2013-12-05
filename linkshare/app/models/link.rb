class Link < ActiveRecord::Base
  has_many :shares, dependent: :destroy


  after_initialize :fillin

  # get title, description, and image_url from embedly
  # save this info maybe?
  # override new Link to get embed.ly information
      #raise @share.link.inspect


  def fillin
    # lookup whether entry exists in DB

    # TRIED TO SAVE CALLS TO EMBEDLY BUT FUCK THAT
    #if found_entry = Link.find_by(url: self.url)
    # if so, fill in info
    #  self.title = "Holy Crap" #found_entry.title
    #  self.description = found_entry.description
    #else
      # if not, generate embedly content
      self.embedly
    #end
  end

  def embedly
    # do some embedly stuff
    embedder = Embedder.new(self.url);
    embedder.getBasics() do |title,description,thumbnail|
      self.title = title
      self.description = description
    end
  end
end

private
class Embedder
  require 'embedly'
  require 'json'

  @embedly_api=nil
  @url=nil

  def initialize(url='www.leekspin.com')
    @url = url
    ######## adds the user 
      @embedly_api = Embedly::API.new :key => EMBEDLY_API_PW, :user_agent => "Mozilla/5.0 (compatible;  SIB-BW-GroupProject/1.0;  jbradfield13@cornellcollege.edu )"
  end


  def getBasics()
    embeded_object = @embedly_api.oembed :url => 'www.xkcd.com'
    embeded_object=embeded_object[0].marshal_dump
    title=embeded_object[:title]
    description=embeded_object[:description]
    thumbnail_url=embeded_object[:thumbnail_url]
    return title, description, thumbnail_url
  end


end