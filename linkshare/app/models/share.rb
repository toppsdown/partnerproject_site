class Share < ActiveRecord::Base
  belongs_to :link
  belongs_to :user
  belongs_to :group
  belongs_to :network

accepts_nested_attributes_for :link

  #has_many_and_belongs_to :tags

  # upvote function
  # upread function
end