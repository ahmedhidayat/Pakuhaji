class SessionsController < ApplicationController
     def create
        username = params[:username]
        password = params[:password]
        admin = Admin.where("username=?", username).first
        admin_password = BCrypt::Engine.hash_secret(password, admin.password_salt) unless admin.blank?
         if !admin_password.blank?
            session[:admin] = admin.id
            flash[:notice] = "Wellcome #{admin.username}"
            redirect_to admin
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
