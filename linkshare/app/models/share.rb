class Share < ActiveRecord::Base
  belongs_to :link
  belongs_to :user
  belongs_to :group
  belongs_to :network

accepts_nested_attributes_for :link

#before_save :authed

# validate :validate_attrs

#   def validate_attrs
#     validate_group
#   end

#   def validate_group
#     raise "Holy Crap validate_group"
#     errors.add(:group_id, "Group is not valid") unless :group_id.exists?
#   end

#   def validate_network

#   end

#   def validate_user

#   end

#   def validate_link

#   end


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
