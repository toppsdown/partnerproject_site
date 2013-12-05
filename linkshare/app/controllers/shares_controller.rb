class SharesController < ApplicationController

  def new
    # responds to extension button click with a form
    # get the embedly for link URL
    @share = User.Share.new()
    @link = User.Link.new(params[:url])
    session[:link] = @link
  end

  def create
    # uses data from extension to generate share
    # send to link model to create/return existing link
    # save to Share
    @link = session[:link]
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
