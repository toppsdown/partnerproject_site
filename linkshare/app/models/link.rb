require("#{Rails.root}/app/classes/embedder.rb")
class Link < ActiveRecord::Base
  include Embedder
  has_many :shares, dependent: :destroy


  before_save :check_if_original
  #after_initialize :check_if_original

  # get title, description, and image_url from embedly
  # save this info maybe?
  # override new Link to get embed.ly information
      #raise @share.link.inspect


  def embedly
    # make API call to embedly and get information
    siteinfo = getBasics(self.url) 
      self.title = siteinfo[0]
      self.description = siteinfo[1]
      self.img_url= siteinfo[2]
  end


  def check_if_original
    self.embedly
    if origin = Link.where(title: self.title, description: self.description).first
      return origin
    else
      return self
    end
  end

  def self.get_original(url)
    ret_link = Link.new(url: url)
    return ret_link.check_if_original
  end



end
