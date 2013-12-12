class Share < ActiveRecord::Base
  belongs_to :link
  belongs_to :user
  belongs_to :group
  belongs_to :network

accepts_nested_attributes_for :link

#before_save :authed

# When creating a share, we must check that group_id, network_id, user_id, and link_id are valid

 #validate :validate_attrs

  # def validate_attrs
  #   validate_group
  #   validate_network
  #   validate_user
  #   validate_link
  # end

  def validate_group
    errors.add(self.group_id, "Group is not valid") unless Group.find_by_id(self.group_id)
  end

  def validate_network
    errors.add(self.network_id, "Network is not valid") unless Network.find_by(id: self.network_id)
  end

  def validate_user
    errors.add(self.user_id, "User is not valid") unless User.find_by(id: self.user_id)
  end

  def validate_link
    errors.add(self.link_id, "User is not valid") unless Link.find_by(id: self.link_id)
  end


# def authed
# 	if !self.group.isprivate
# 	elsif self.user.group_id != self.group.id
# 		throw error
# 	end
# end
  #has_many_and_belongs_to :tags

  # upvote function
  # upread function
end
