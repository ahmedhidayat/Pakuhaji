class SlidersController < ApplicationController
   before_action :check_current_admin, only: [:new, :create, :edit, :update, :destroy, :index]
  layout "admin_application"
  def index
     @slider = Slider.page(params[:page]) .per(5)
  end
  
  def new
    @slider = Slider.new  
  end

   def create
    @slider = Slider.new(slider_params)
    if @slider.save
      redirect_to action: 'index', notice: 'User was successfully created.'
    else
      render action: 'new', alert: 'User could not be created' 
    end
  end

   def update
     @slider = Slider.find_by_id(params[:id])
      if @slider.update(slider_params)
      flash[:notice] = "Success Update Record"
      redirect_to action: 'index'
    else
      flash[:error] = "Data Not Valid"
      render 'edit'
    end
  end
  
  def edit
    @slider = Slider.find_by_id(params[:id])
  end
  
   def destroy
     @slider = Slider.find_by_id(params[:id])
      if @slider.destroy
      flash[:notice] = "Success Delete a Record"
      redirect_to action: 'index'
    else
      flash[:error] = "Data Not Valid"
      render 'edit'
    end
    
  end

private
    # Never trust parameters from the scary internet, only allow the white list through.
    def slider_params
      params.require(:slider).permit(:title, :content, :picture)
    end
end
