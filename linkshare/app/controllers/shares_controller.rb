class SharesController < ApplicationController

  before_filter :authenticate_user!

  def index
    @shares = Share.order(:id)
  end

  def new
    # responds to extension button click with a form
    # get the embedly for link URL
    @share = current_user.shares.new()
    @link = Link.new(url: "http://www.leekspin.com")#params[:url])
    user_session[:link] = @link

    respond_to do |format|
      format.html { render :layout => false }
    end
  end

  def create
    # uses data from extension to generate share
    # send to link model to create/return existing link
    # save to Share
    @link = user_session[:link]
    share_params[:link_id] = @link[:id]
    @share = User.Share(share_params)
    @link.save
    @share.save
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
   params.require(:share).permit(:network_id,:name,:description,:img_url)
  end

  def link_params
    params.require(:link).permit(:url)
  end

end
