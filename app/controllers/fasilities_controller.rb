class FasilitiesController < ApplicationController
  before_action :check_current_admin, only: [:new, :create, :edit, :update, :destroy, :index]
  layout "admin_application"
  def index
    @fasility = Fasility.all
  end

  def new
    @fasility = Fasility.new
  end
  
  def create
  @fasility = Fasility.new(fasility_params)
    if @fasility.save
      redirect_to action: 'index', notice: 'User was successfully created.'
    else
      render action: 'new', alert: 'User could not be created' 
    end  
  end
  
 def update
     @fasility = Fasility.find_by_id(params[:id])
      if @fasility.update(fasility_params)
      flash[:notice] = "Success Update Record"
      redirect_to action: 'index'
    else
      flash[:error] = "Data Not Valid"
      render 'edit'
    end
  end
  
  def edit
    @fasility = Fasility.find_by_id(params[:id])
  end
  
  def show
  end
  
  def destroy
     @fasility = Fasility.find_by_id(params[:id])
      if @fasility.destroy
      flash[:notice] = "Success Delete a Record"
      redirect_to action: 'index'
    else
      flash[:error] = "Data Not Valid"
      render 'edit'
    end
   end
 
 private
    # Never trust parameters from the scary internet, only allow the white list through.
    def fasility_params
      params.require(:fasility).permit(:title, :content, :picture1, :picture2, :picture3)
    end 
end