class VacationPacketsController < ApplicationController
before_action :check_current_admin, only: [:new, :create, :edit, :update, :destroy, :index]
  layout "admin_application"
  def index
    @vacation_packet = VacationPacket.page(params[:page]) .per(5)
  end
  
  def new
    @vacation_packet = VacationPacket.new  
  end

   def create
    @vacation_packet = VacationPacket.new(vacation_packet_params)
    if @vacation_packet.save
      redirect_to action: 'index', notice: 'User was successfully created.'
    else
      render action: 'new', alert: 'User could not be created' 
    end
  end

   def update
     @vacation_packet = VacationPacket.find_by_id(params[:id])
      if @vacation_packet.update(vacation_packet_params)
      flash[:notice] = "Success Update Record"
      redirect_to action: 'index'
    else
      flash[:error] = "Data Not Valid"
      render 'edit'
    end
  end
  
  def edit
    @vacation_packet = VacationPacket.find_by_id(params[:id])
  end

  def show
      @vacation_packet = VacationPacket.find_by_id(params[:id])
  end
  
   def destroy
     @vacation_packet = VacationPacket.find_by_id(params[:id])
      if @vacation_packet.destroy
      flash[:notice] = "Success Delete a Record"
      redirect_to action: 'index'
    else
      flash[:error] = "Data Not Valid"
      render 'edit'
    end
    
  end

private
    # Never trust parameters from the scary internet, only allow the white list through.
    def vacation_packet_params
      params.require(:vacation_packet).permit(:title, :qty_game, :price_kid, :price_adult)
    end
end
