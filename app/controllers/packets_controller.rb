class PacketsController < ApplicationController
  before_action :check_current_admin, only: [:new, :create, :edit, :update, :destroy, :index]
  layout "admin_application"
  def index
    @packet = Packet.all
  end

  def new
    @packet = Packet.new
  end
  
  def create
  @packet = Packet.new(packet_params)
    if @packet.save
      redirect_to action: 'index', notice: 'User was successfully created.'
    else
      render action: 'new', alert: 'User could not be created' 
    end  
  end
  
  def update
     @packet = Packet.find_by_id(params[:id])
      if @packet.update(packet_params)
      flash[:notice] = "Success Update Record"
      redirect_to action: 'index'
    else
      flash[:error] = "Data Not Valid"
      render 'edit'
    end
  end
  
  def edit
    @packet = Packet.find_by_id(params[:id])
  end

  def show
  end
  
  def destroy
     @packet = Packet.find_by_id(params[:id])
      if @packet.destroy
      flash[:notice] = "Success Delete a Record"
      redirect_to action: 'index'
    else
      flash[:error] = "Data Not Valid"
      render 'edit'
    end
   end
 
 private
    # Never trust parameters from the scary internet, only allow the white list through.
    def packet_params
      params.require(:packet).permit(:title, :content, :picture)
    end 
end
