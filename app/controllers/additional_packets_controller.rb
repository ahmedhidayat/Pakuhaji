class AdditionalPacketsController < ApplicationController
before_action :check_current_admin, only: [:new, :create, :edit, :update, :destroy, :index]
  layout "admin_application"
  def index
    @additional_packet = AdditionalPacket.all
  end
  
  def new
    @additional_packet = AdditionalPacket.new  
  end

   def create
    @additional_packet = AdditionalPacket.new(additional_packet_params)
    if @additional_packet.save
      redirect_to action: 'index', notice: 'User was successfully created.'
    else
      render action: 'new', alert: 'User could not be created' 
    end
  end

   def update
     @additional_packet = AdditionalPacket.find_by_id(params[:id])
      if @additional_packet.update(additional_packet_params)
      flash[:notice] = "Success Update Record"
      redirect_to action: 'index'
    else
      flash[:error] = "Data Not Valid"
      render 'edit'
    end
  end
  
  def edit
    @additional_packet = AdditionalPacket.find_by_id(params[:id])
  end

  def show
      @additional_packet = AdditionalPacket.find_by_id(params[:id])
  end
  
   def destroy
     @additional_packet = AdditionalPacket.find_by_id(params[:id])
      if @additional_packet.destroy
      flash[:notice] = "Success Delete a Record"
      redirect_to action: 'index'
    else
      flash[:error] = "Data Not Valid"
      render 'edit'
    end
    
  end

private
    # Never trust parameters from the scary internet, only allow the white list through.
    def additional_packet_params
      params.require(:additional_packet).permit(:content, :price)
    end
end
