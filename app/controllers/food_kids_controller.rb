class FoodKidsController < ApplicationController
 before_action :check_current_admin, only: [:new, :create, :edit, :update, :destroy, :index]
  layout "admin_application"
  def index
    @food_kid = FoodKid.all
  end
  
  def new
    @food_kid = FoodKid.new  
  end

   def create
    @food_kid = FoodKid.new(food_kid_params)
    if @food_kid.save
      redirect_to action: 'index', notice: 'User was successfully created.'
    else
      render action: 'new', alert: 'User could not be created' 
    end
  end

   def update
     @food_kid = FoodKid.find_by_id(params[:id])
      if @food_kid.update(food_kid_params)
      flash[:notice] = "Success Update Record"
      redirect_to action: 'index'
    else
      flash[:error] = "Data Not Valid"
      render 'edit'
    end
  end
  
  def edit
    @food_kid = FoodKid.find_by_id(params[:id])
  end

  def show
      @food_kid = FoodKid.find_by_id(params[:id])
  end
  
   def destroy
     @food_kid = FoodKid.find_by_id(params[:id])
      if @food_kid.destroy
      flash[:notice] = "Success Delete a Record"
      redirect_to action: 'index'
    else
      flash[:error] = "Data Not Valid"
      render 'edit'
    end
    
  end

private
    # Never trust parameters from the scary internet, only allow the white list through.
    def food_kid_params
      params.require(:food_kid).permit(:content, :price)
    end
end
