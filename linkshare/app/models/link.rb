class Link < ActiveRecord::Base
  has_many :shares, dependent: :destroy
  
  # get title, description, and image_url from embedly
  # save this info maybe?
  # override new Link to get embed.ly information

  def after_initialize
    # lookup whether entry exists in DB

    if found_entry = Link.find_by(url: self.url)
    # if so, fill in info
      self.title = found_entry.title
      self.description = found_entry.description
    else
      # if not, generate embedly content
      self.embedly
    end
  end

  def embedly
    # do some embedly stuff
    embedly_response = #stuff
    self.title = embedly_response.title
    self.description = embedly_response.description
  end

end
