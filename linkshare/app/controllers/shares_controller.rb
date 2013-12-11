class SharesController < ApplicationController

  before_filter :authenticate_user!

  def index
    @shares = Share.order(:id)
  end

  def new
    # responds to extension button click with a form
    # get the embedly for link URL
    
    @share = current_user.shares.new()
    @share.build_link(url: params[:url])
    @groups = current_user.groups
    #raise @share.link.inspect
    #@share.build_link
    respond_to do |format|
      format.html { render :layout => false }
    end
  end

  def create
    # uses data from extension to generate share
    # send to link model to create/return existing link
    # save to Share
    @groups = params[:groups]
    if @groups
      @groups.each do |gid|
        @share = current_user.shares.new(share_params)
        @share.build_link(share_params[:link_attributes])
        @share.save
      end
    end
    respond_to do |format|
      format.html { render :layout => false }
    end
  end

  def edit
    # user can change title/description
  end

  def update
    # submit changes

  end

  def destroy
    # delete share
  end

  private
  def share_params
   params.require(:share).permit(:user_id,:link_id,:network_id,:group_id,:reads,:votes,
    :link_attributes => [:id,:title,:description,:url])
  end



  #def link_params
  #  params.require(:link).permit(:url)
  #end

end
