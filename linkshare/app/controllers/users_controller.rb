class UsersController < ApplicationController

  before_filter :authenticate_user!

  def index
    @shares = current_user.shares
    @groups = current_user.groups
  end

end
