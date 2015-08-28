class GamesController < ApplicationController
  before_action :check_current_admin, only: [:new, :create, :edit, :update, :destroy, :index]
  layout "admin_application"
  def index
    @game = Game.page(params[:page]) .per(5)
  end

  def new
    @game = Game.new
  end
  
  def create
  @game = Game.new(game_params)
    if @game.save
      redirect_to action: 'index', notice: 'User was successfully created.'
    else
      render action: 'new', alert: 'User could not be created' 
    end  
  end
  
def update
     @game = Game.find_by_id(params[:id])
      if @game.update(game_params)
      flash[:notice] = "Success Update Record"
      redirect_to action: 'index'
    else
      flash[:error] = "Data Not Valid"
      render 'edit'
    end
  end
  
  def edit
    @game = Game.find_by_id(params[:id])
  end

  def show
  end
  
  def destroy
     @game = Game.find_by_id(params[:id])
      if @game.destroy
      flash[:notice] = "Success Delete a Record"
      redirect_to action: 'index'
    else
      flash[:error] = "Data Not Valid"
      render 'edit'
    end
   end
 
 private
    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      params.require(:game).permit(:title, :content, :picture1, :picture2, :picture3)
    end 
end