class ReservationsController < ApplicationController

def index
    @reservation = Reservation.all
  end
  
  def new
       @reservation = Reservation.new
       @game = Game.all
       @games = Game.find(params[:game_ids])
       @additional_packet = AdditionalPacket.all
  end

   def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      redirect_to action: 'index', notice: 'User was successfully created.'
    else
      render action: 'new', alert: 'User could not be created' 
    end
    
  end

   def update
     @reservation = Reservation.find_by_id(params[:id])
      if @reservation.update(reservation_params)
      flash[:notice] = "Success Update Record"
      redirect_to action: 'index'
    else
      flash[:error] = "Data Not Valid"
      render 'edit'
    end
  end
  
  def edit
    @reservation = Reservation.find_by_id(params[:id])
  end

  def show
      @reservation = Reservation.find_by_id(params[:id])
  end
  
   def destroy
     @reservation = Reservation.find_by_id(params[:id])
      if @reservation.destroy
      flash[:notice] = "Success Delete a Record"
      redirect_to action: 'index'
    else
      flash[:error] = "Data Not Valid"
      render 'edit'
    end
    
  end

private
    # Never trust parameters from the scary internet, only allow the white list through.
    def reservation_params
      params.require(:reservation).permit(:date_now, :date_booked, :id_vacation_packet, :id_game, :people_kid,
                                           :people_adult, :id_food_kid, :id_food_adult, :id_additional_packet, :total)
    end
end
