class ReservationsController < ApplicationController
before_filter :select_tag_reservation, except: [:index, :edit, :update, :destroy, :update_status, :search]
respond_to :xlsx, :html
  def index      
    condition = []
    unless session[:date_booked_start].blank?
      condition << "DATE(date_booked) BETWEEN #{session[:date_booked_start].to_date} AND #{session[:date_booked_start].to_date}"
    end
    unless session[:status].blank?
      condition << "status = '#{session[:status].to_s}'"     
    end
    conditions = condition.join(" OR ")    
    if session[:date_booked_start].present? || session[:status].present?
      @reservation = Reservation.where(conditions).page(params[:page]).per(5)
    else
      @reservation = Reservation.page(params[:page]).per(5)
    end             
    render layout: "admin_application"
  end
  
  def new
       @reservation = Reservation.new                     
  end

   def create  
    @reservation = Reservation.new(reservation_params)
    @reservation.customer_id = Customer.last.id 
    @reservation.vacation_packet_id = (session[:session_vacation_packet_id])              
    if session[:session_vacation_packet_id].present?
       price_kid = VacationPacket.find(session[:session_vacation_packet_id]).price_kid
       result_kid = price_kid * params[:reservation][:kid_count].to_i       
       price_adult = VacationPacket.find(session[:session_vacation_packet_id]).price_adult
       result_adult = price_adult * params[:reservation][:adult_count].to_i               
       @reservation.total = result_kid + result_adult  
       @reservation.vacation_packet_id = session[:session_vacation_packet_id]        
       if params[:additional_packet_ids].present?
         price_additional_packet = []
       params[:additional_packet_ids].each do |id|        
        price_additional_packet << AdditionalPacket.find(id).price          
       end       
       @reservation.total = @reservation.total + (price_additional_packet.sum)     
      end
    end  
    unless @loop.blank?
      (1..@loop.to_i).each do |i|
        a = i - 1
        session["game_#{i}"] = params[:game_ids]["#{a}".to_i]
      end
    end
    session[:session_food_kid] = params[:food_kids][0]
    session[:session_food_adult] = params[:food_adults][0]
  
       @reservation.transaction_code = Reservation.transaction_code 
    if @reservation.save
       
      unless params[:game_ids].blank?
        params[:game_ids].each do |id|
          reservation_game = ReservationGame.new(reservation_id: @reservation.id, game_id: id)
          reservation_game.save
        end
        unless params[:additional_packet_ids].blank?
        params[:additional_packet_ids].each do |id|
          reservation_additional_packet = ReservationAdditionalPacket.new(reservation_id: @reservation.id, additional_packet_id: id)
          reservation_additional_packet.save
        end
        unless params[:food_kids].blank?  
          params[:food_kids].each do |id|      
          reservation_food = ReservationFood.new(reservation_id: @reservation.id, food_id: id)
          reservation_food.save
          end
        end
         unless params[:food_adults].blank?  
          params[:food_adults].each do |id|      
          reservation_food = ReservationFood.new(reservation_id: @reservation.id, food_id: id)
          reservation_food.save
          end
        end
       end 
      end
      redirect_to "/homes", notice: 'User was successfully created.'
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
     if params[:id].present?
       g = ReservationGame.find_all_by_reservation_id(params[:id])
       ap = ReservationAdditionalPacket.find_all_by_reservation_id(params[:id]) 
       @g = g
       @ap = ap
              
     end   
     render layout: "admin_application"     
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
  
  def update_status
    @reservation = Reservation.find(params[:id])
    @reservation.update_attributes(status:params[:status])
    ReservationConfirmationMailer.reservation_confirm_email(@reservation).deliver
    flash[:notice] = "Success Update Record"
    redirect_to action: 'index'
  end
  
  def select_tag_reservation
    @vacationpacket = VacationPacket.all.map{|x|[x.title, x.id]}
    @game = Game.all.map{|x|[x.title, x.id]}
    @food = Food.kid
    @foodadult = Food.adult 
    @additional_packet = AdditionalPacket.all 
    @loop = VacationPacket.find(session[:session_vacation_packet_id]).qty_game
  end
  
  def search 
    session[:date_booked_start] = params[:date_booked_start]
    session[:date_booked_end] = params[:date_booked_end]
    session[:status] = params[:status]
    redirect_to action: 'index'
  end
    
    

private
    # Never trust parameters from the scary internet, only allow the white list through.
    def reservation_params
      params.require(:reservation).permit( :date_booked, :vacation_packet_id, :kid_count,
                                           :adult_count, :customer_id, :total, :status)
    end
end
