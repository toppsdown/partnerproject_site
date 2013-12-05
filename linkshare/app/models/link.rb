class Link < ActiveRecord::Base
  has_many :shares, dependent: :destroy
  

  after_initialize :fillin

  # get title, description, and image_url from embedly
  # save this info maybe?
  # override new Link to get embed.ly information

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
    #embedly_response = #stuff
    self.title = "Leekspin" #embedly_response.title
    self.description = "Bitches love leeks" #embedly_response.description
  end

end
