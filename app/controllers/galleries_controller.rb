class GalleriesController < ApplicationController
   before_action :check_current_admin, only: [:new, :create, :edit, :update, :destroy, :index]
  layout "admin_application"
  def index
  @gallery = Gallery.all
  end

  def new
    @gallery = Gallery.new
  end

def update
     @gallery = Gallery.find_by_id(params[:id])
      if @gallery.update(gallery_params)
      flash[:notice] = "Success Update Record"
      redirect_to action: 'index'
    else
      flash[:error] = "Data Not Valid"
      render 'edit'
    end
  end
  
  def edit
    @gallery = Gallery.find_by_id(params[:id])
  end
  
   def create
    @gallery = Gallery.new(gallery_params)
    if @gallery.save
      redirect_to action: 'index', notice: 'User was successfully created.'
    else
      render action: 'new', alert: 'User could not be created' 
    end
  end

  def show
  end
  
  def destroy
     @gallery = Gallery.find_by_id(params[:id])
      if @gallery.destroy
      flash[:notice] = "Success Delete a Record"
      redirect_to action: 'index'
    else
      flash[:error] = "Data Not Valid"
      render 'edit'
    end
   end
  
  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def gallery_params
      params.require(:gallery).permit(:picture)
    end 
end
