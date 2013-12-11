class Share < ActiveRecord::Base
  belongs_to :link
  belongs_to :user
  belongs_to :group
  belongs_to :network

accepts_nested_attributes_for :link

before_save :authed



def authed
	if !self.group.isprivate
	elsif self.user.group_id != self.group.id
		throw error
	end
end
  #has_many_and_belongs_to :tags

  # upvote function
  # upread function
end
