class SessionsControllerController < ApplicationController
  def new
  end

  def create
  	employee = Employee.from_omniauth(env["omniauth.auth"])
  	session[:employee_id] = employee.id
  	render text: 'Signed in!'
  end

  def destroy
  	session[:employee_id] = nil
  	redirect_to "http://localhost:3000/", notice: 'Signed out!'
  end

  def failure
  	render text: 'params[:message]'
  end
end
