class UsersController < ApplicationController

  before_filter :authenticate_user!

  def index
    @shares = current_user.shares
    @groups = current_user.groups
  end

  def form_test
    @share = current_user.shares.new()
    @groups = current_user.groups
    respond_to do |format|
      format.html { render :layout => false }
    end
  end

end
