class SessionsController < ApplicationController
     def create
        username = params[:username]
        password = params[:password]
        admin = Admin.where("username=?", username).first
        admin_password = admin.password_salt unless admin.blank?
         if !admin_password.blank? and admin.password_hash.eql? admin_password
            session[:admin] = admin.id
            flash[:notice] = "Wellcome #{admin.username}"
            redirect_to root_url
        else
            params[:username]
            flash[:error] = "Your data not valid"
            render "new"
        end
    end
    
    def new
      
    end
    
    def destroy
    session[:admin] = nil

        flash[:notice] = "logout session success"

        redirect_to root_url
    end
end
