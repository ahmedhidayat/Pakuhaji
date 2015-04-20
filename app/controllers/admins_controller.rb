class AdminsController < ApplicationController
  def index
  end

  def new
    @admin = Admin.new
  end

  def create
   @admin = Admin.new(admin_params)
   if @admin.save
            flash[:notice] = "Success Add Records"
            redirect_to root_url
        else
            flash[:error] = "data not valid"
            render "new"
        end  
  end
  
  def edit
  end
end
private
        def admin_params
            params.require(:admin).permit(:username, :password)
        end