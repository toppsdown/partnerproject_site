class NetworksController < ApplicationController

  def index
    # display list of networks for user to add
    # should be ordered by most relevant/popular
    @networks = current_user.Network.order(:name)
  end

  def show
    # displays network information
    unless @network = current_user.Network.find_by_id params[:id]
      redirect_to :back, notice: "This network does not exist"
    end

    def new
    # Generate form for network creator to fill out
    @network = current_user.Network.new()
  end

  def create
    # save network in database
    @network = current_user.Network.new(network_params)
    if @network.save
      redirect_to @network
    else
      render 'new'
    end

    def edit
    # provides same form as new
    # need to add network
    @network = current_user.Network.find_by(id: params[:id])
  end

  def update
    # saves data from edit
    @network = current_user.Network.find_by(id: params[:id])
    if @network.update(network_params)
      redirect_to @network
    else
      render 'edit'
    end
  end

  def destroy
    # removes network from database
    # eventually removes all entries from usernetworks table
    @network = current_user.Network.find_by(id: params[:id])
    @network.destroy
    redirect_to networks_path
  end

  private
  def network_params
   params.require(:network).permit(:network_id,:name,:description,:img_url)
 end



end
