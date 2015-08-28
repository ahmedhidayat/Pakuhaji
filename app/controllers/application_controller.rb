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
        
        private
        
        def current_temporary
          Temporary.find(session[:temporary_id])
        rescue ActiveRecord::RecordNotFound
          temporary = Temporary.create
          session[:temporary_id] = temporary.id
          temporary
        end

        def convert_to_arr_for_query(ids_param)
          key_string = "("
          ids_param.each do |x|
            key_string << "#{x},"
          end
          key_string[key_string.length-1] = ")"
          key_string
        end
end
