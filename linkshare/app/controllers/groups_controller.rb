class GroupsController < ApplicationController
	# add group owner to group entry.  Only this user can edit group
	# before filter only: destroy isOwner


	def index
		# display list of groups for user to add
    # should be ordered by most relevant/popular
    @groups = Group.order(:name)
	end

	def show
		# displays group information
    unless @group = Group.find_by_id(params[:id])
      redirect_to :back, notice: "This group does not exist"
    end
	end

	def new
		# Generate form for group creator to fill out
		@group = Group.new()
	end

	def create
		# save group in database
		@group = Group.new(group_params)
		if @group.save
			redirect_to @group
		else
			render 'new'
    end
  end

   def edit
		# provides same form as new
		# need to add group
		@group = Group.find_by(id: params[:id])
	end

	def update
		# saves data from edit
		@group = Group.find_by(id: params[:id])
		if @group.update(group_params)
      redirect_to @group
    else
      render 'edit'
    end
  end

  def destroy
		# removes group from database
		# eventually removes all entries from usergroups table
    @group = Group.find_by(id: params[:id])
    @group.destroy
    redirect_to groups_path
	end

  def join
    @group = Group.find_by(id: params[:id])
    @group.update_attributes(user_ids: current_user.id)
    @group.save
    redirect_to @group
  end

  def leave
    @group=Group.find_by(id: params[:id])
    @group.users.delete(User.find current_user.id)
    redirect_to @group
  end

	private
  def group_params
   params.require(:group).permit(:network_id,:name,:description,:img_url)
 end

end
