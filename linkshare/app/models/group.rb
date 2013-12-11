class Group < ActiveRecord::Base
  has_and_belongs_to_many :users
  belongs_to :network
  has_many :shares
  #has_many :tags

  validates_uniqueness_of :name
  # function to get X number of popular groups


end
