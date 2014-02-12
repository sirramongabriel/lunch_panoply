class ApplicationController < ActionController::Base
  protect_from_forgery
  
  # helper_method :current_employee
 	# helper_method :employee_signed_in?
 	# helper_method :correct_employee?
 
  private
  def current_employee
    @current_employee ||= Employee.find(session[:employee_id]) if session[:employee_id]
  end

  # def employee_signed_in?
  # 	return true if current_employee
  # end

  # def correct_employee?
  # 	@employee = Employee.find(params[:id])
  # 	unless current_employee = @employee
  # 		redirect_to root_path, alert: 'Access denied.'
  # 	end
  # end

  def authenticate_employee!
  	if !current_employee
  		redirect_to root_path, alert: 'You need to sign in for access to this page.'
  	end
  end
end
