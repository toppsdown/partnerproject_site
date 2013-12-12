class SharesController < ApplicationController

  before_filter :authenticate_user!, except: [:new,:create]
  before_filter :authed?, only: [:new,:create]



  def index
    @shares = Share.order(:id)
  end

  def new
    # responds to extension button click with a form
    # get the embedly for link URL
    
    @share = current_user.shares.new()
    #@share.build_link(url: params[:url])
    #@share.link = Link.new(url: params[:url]).check_if_original
    @share.link = Link.get_original(params[:url])
    @groups = current_user.groups.where(:solo => false)
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
    @groups = params[:groups] || []
    @groups[current_user.my_group] = current_user.my_group
      @groups.each do |k, g_id|
        @share = current_user.shares.new(share_params)
        @share.group_id = g_id.to_i
        @share.network_id = current_user.network_id
        # this is really ugly, but it's the only way I could figure out how to not duplicate links
        @share.link = Link.get_original(share_params[:link_attributes][:url])
        #raise YAML::dump(@share.link)
        @share.save
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



  def authed?
    if user_signed_in?
      return true
    else
      render :file => Rails.root + "/app/views/users/log_in.html.erb", layout: false
      return false
    end
  end


  private
  def share_params
   params.require(:share).permit(:user_id,:link_id,:network_id,:group_id,:reads,:votes,
    :link_attributes => [:url])#[:id,:title,:description,:url])
  end



  #def link_params
  #  params.require(:link).permit(:url)
  #end

end
