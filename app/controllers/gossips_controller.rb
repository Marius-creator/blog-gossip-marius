class GossipsController < ApplicationController

before_action :set_gossip, only: [:edit, :update, :show, :destroy]

  def new
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.new(gossip_params)
    @gossip.user = User.first
    if @gossip.save
     flash[:success] = "Gossip was successfully created"
     redirect_to gossip_path(@gossip)
    else
     render 'new'
    end
  end

  def show
  end

  def update
    if @gossip.update(gossip_params)
     flash[:success] = "Gossip was updated"
     redirect_to gossip_path(@gossip)
    else
     flash[:success] = "Gossip was not updated"
     render 'edit'
   end
 end

   def edit
   end

   def index
     @gossips = Gossip.paginate(page: params[:page], per_page: 5)
   end

   def destroy
    @gossip.destroy
    flash[:success] = "Gossip was deleted"
    redirect_to gossips_path
  end

  private
  def gossip_params
   params.require(:gossip).permit(:title, :content)
  end
  def set_gossip
   @gossip = Gossip.find(params[:id])
  end

end
