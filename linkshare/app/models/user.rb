class User < ActiveRecord::Base
  has_and_belongs_to_many :groups
  belongs_to :networks
  has_many :shares
  has_many :links, :through => :shares

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
    link_network
    generate_group
  end

  def link_network
    # the only network we want to use is the default
    network = Network.first
    self.network_id = network.id
  end

  def generate_group
    users_group = Group.new(:network_id => self.network_id, :private => true, :name => self.email)
    if users_group.save
      self.my_group = users_group.id
    end
  end

  def valid_group
    errors.add(self.my_group, "Group is not valid") unless self.group_id.exists?
  end

  # after the user has been saved in the users table, link to its associated private group
  def link_group
    users_group = Group.find_by(id: self.my_group)
    if users_group
      users_group.update_attributes(user_ids: self.id)
    end
  end
end
