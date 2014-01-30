class SessionsControllerController < ApplicationController
  def new
  end

  def create
  	auth = Employee.request.env["omniauth.auth"])
    employee = Employee.find_by_provider_and_uid(auth["provider"], auth["uid"]) ||
    Employee.create_with_omniauth(auth)
  	session[:employee_id] = employee.id
  	render text: 'Signed in!'
  end

  def destroy
  	session[:employee_id] = nil
  	redirect_to root_path, notice: 'Signed out!'
  end

  def failure
  	render text: 'params[:message]'
  end
end
