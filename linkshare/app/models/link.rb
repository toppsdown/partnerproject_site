require("#{Rails.root}/app/classes/embedder.rb")
class Link < ActiveRecord::Base
  include Embedder
  has_many :shares, dependent: :destroy


  before_save :fillin

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
    siteinfo = getBasics(self.url) do |data|
      console.LOG(data);
      self.title = data[0]
      self.description = data[1]
      self.img_url= data[2]
    end
  end
end
