class Group < ActiveRecord::Base
  has_and_belongs_to_many :users
  belongs_to :network
  has_many :shares
  #has_many :tags

  validates_uniqueness_of :name, scope: :network_id, :unless => :solo?
  # function to get X number of popular groups


  validate :valid_network

  def valid_network
    errors.add(:network_id, "Network is not valid") unless Network.find_by_id(self.network_id)
  end

  def is_solo?
    self.solo?
  end

end
