class FoodAdultsController < ApplicationController
 before_action :check_current_admin, only: [:new, :create, :edit, :update, :destroy, :index]
  layout "admin_application"
  def index
    @food_adult = FoodAdult.all
  end
  
  def new
    @food_adult = FoodAdult.new  
  end

   def create
    @food_adult = FoodAdult.new(food_adult_params)
    if @food_adult.save
      redirect_to action: 'index', notice: 'User was successfully created.'
    else
      render action: 'new', alert: 'User could not be created' 
    end
  end

   def update
     @food_adult = FoodAdult.find_by_id(params[:id])
      if @food_adult.update(food_adult_params)
      flash[:notice] = "Success Update Record"
      redirect_to action: 'index'
    else
      flash[:error] = "Data Not Valid"
      render 'edit'
    end
  end
  
  def edit
    @food_adult = FoodAdult.find_by_id(params[:id])
  end

  def show
      @food_adult = FoodAdult.find_by_id(params[:id])
  end
  
   def destroy
     @food_adult = FoodAdult.find_by_id(params[:id])
      if @food_adult.destroy
      flash[:notice] = "Success Delete a Record"
      redirect_to action: 'index'
    else
      flash[:error] = "Data Not Valid"
      render 'edit'
    end
    
  end

private
    # Never trust parameters from the scary internet, only allow the white list through.
    def food_adult_params
      params.require(:food_adult).permit(:content, :price)
    end
end


