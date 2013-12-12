require("#{Rails.root}/app/classes/embedder.rb")
class Link < ActiveRecord::Base
  include Embedder
  has_many :shares, dependent: :destroy


  before_save :check_if_original

  # get title, description, and image_url from embedly
  # save this info maybe?
  # override new Link to get embed.ly information
      #raise @share.link.inspect

  def embedly
    # do some embedly stuff
    siteinfo = getBasics(self.url) 
      puts siteinfo
      self.title = siteinfo[0]
      self.description = siteinfo[1]
      self.img_url= siteinfo[2]
  end

  def check_if_original

    self.embedly

    origin = Link.where(title: self.title, description: self.description)
    if origin
      return origin
    end
    # lookup whether entry exists in DB

    # TRIED TO SAVE CALLS TO EMBEDLY BUT FUCK THAT
    #if found_entry = Link.find_by(url: self.url)
    # if so, fill in info
    #  self.title = "Holy Crap" #found_entry.title
    #  self.description = found_entry.description
    #else

  end



end
