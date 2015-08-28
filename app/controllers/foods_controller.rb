class FoodsController < ApplicationController
 before_action :check_current_admin, only: [:new, :create, :edit, :update, :destroy, :index]
  layout "admin_application"
  def index
    @food = Food.page(params[:page]) .per(5)
  end
  
  def new
    @food = Food.new  
  end

   def create
    @food = Food.new(food_params)
    if @food.save
      redirect_to action: 'index', notice: 'User was successfully created.'
    else
      render action: 'new', alert: 'User could not be created' 
    end
  end

   def update
     @food = Food.find_by_id(params[:id])
      if @food.update(food_params)
      flash[:notice] = "Success Update Record"
      redirect_to action: 'index'
    else
      flash[:error] = "Data Not Valid"
      render 'edit'
    end
  end
  
  def edit
    @food = Food.find_by_id(params[:id])
  end

  def show
      @food = Food.find_by_id(params[:id])
  end
  
   def destroy
     @food = Food.find_by_id(params[:id])
      if @food.destroy
      flash[:notice] = "Success Delete a Record"
      redirect_to action: 'index'
    else
      flash[:error] = "Data Not Valid"
      render 'edit'
    end
    
  end

private
    # Never trust parameters from the scary internet, only allow the white list through.
    def food_params
      params.require(:food).permit(:name, :category)
    end
end
