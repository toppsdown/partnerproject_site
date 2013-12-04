class Group < ActiveRecord::Base
  validates_uniqueness_of :name
  # function to get X number of popular groups
end
