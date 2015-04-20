class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  helper_method :current_admin, :check_current_admin


        def current_admin
            current_admin ||= Admin.where("id = ?", session[:admin]).first
        end

        def check_current_admin
            if current_admin.blank?
                flash[:error] = "plase login first before run the action"
                redirect_to new_session_url
            else
                current_admin
            end
        end
end
