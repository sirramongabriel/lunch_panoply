class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  
  private
  
  def current_employee
    @current_employee ||= Employee.find(session[:employee_id]) if session[:employee_id]
  end
end
