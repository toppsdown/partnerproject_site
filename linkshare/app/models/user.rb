class User < ActiveRecord::Base
  has_and_belongs_to_many :groups
  belongs_to :networks
  has_many :shares
  has_many :links, :through => :shares, :uniq => true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  # We need to create a group when we create a user
  # This is not best practice, but we don't know how to get around devise
  before_save :prereqs
  after_save :link_group
  #validate :valid_group


  # this is all going to be back asswards
  # Create a user
  # Create a group just for that user
  # Link that group to the main network
  # Link that user to the main network
  # Currently network is just a magic value we have created

  def prereqs
    create_or_link_network
    generate_group
  end

  def create_or_link_network
    # the only network we want to use is the default
    domain = self.email.split("@").last
    network = Network.where(:email_domain=>domain).first || Network.new(:email_domain=>domain)
    network.save
    self.network_id = network.id
  end

  def generate_group
    # create a private group for this user
    unless self.my_group
      users_group = Group.new(:network_id => self.network_id, :solo => true, :name => self.email)
      if users_group.save
        self.my_group = users_group.id
      end
    end
  end

  # after the user has been saved in the users table, link to its associated private group in join table
  def link_group
    users_group = Group.find_by(id: self.my_group)
    if users_group
      users_group.update_attributes(user_ids: self.id)
    end
  end

  def get_owner_links
    # create a hash with the key being a link object and the value being an array of its shares
    ret_hash = {}
    self.links.each do |l|
      share_ary = []
      l.shares.each do |s|
        share_ary << s
      end
      ret_hash[l => share_ary]
    end
  end

  
end
