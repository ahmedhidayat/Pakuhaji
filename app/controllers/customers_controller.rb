class CustomersController < ApplicationController
before_filter :select_tag_vacation_packet
def index
    @customer = Customer.all
  end
  
  def new
    @customer = Customer.new  
    
  end

   def create
    @customer = Customer.new(customer_params)
    if @customer.save
      session[:session_customer] = @customer.id
      session[:session_vacation_packet_id] = params[:vacation_packet_id]
      redirect_to "/reservations/new", notice: 'User was successfully created.'
    else
      render action: 'new', alert: 'User could not be created' 
    end
  end

   def update
     @customer = Customer.find_by_id(params[:id])
      if @customer.update(customer_params)
        session[:session_vacation_packet_id] = params[:vacation_packet_id]
      flash[:notice] = "Success Update Record"
      redirect_to "/reservations/new" 
    else
      flash[:error] = "Data Not Valid"
      render 'edit'
    end
  end
  
  def edit
    @customer = Customer.find_by_id(params[:id])
  end
  
   def destroy
     @customer = Customer.find_by_id(params[:id])
      if @customer.destroy
      flash[:notice] = "Success Delete a Record"
      redirect_to action: 'index'
    else
      flash[:error] = "Data Not Valid"
      render 'edit'
    end
    
  end
  
  def select_tag_vacation_packet
    @vacationpacket = VacationPacket.all.map{|x|[x.title, x.id]}
  end

private
    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:name, :address, :telephone, :email)
    end
end
