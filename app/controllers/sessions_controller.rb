class SessionsControllerController < ApplicationController
  def new
    redirect_to 'auth/facebook'
  end

  # def create
  #   # @employee = Employee.find_or_create_from_auth_hash(auth_hash)
  #   # self.current_employee = @employee
  #   # redirect_to('/')
  # end

  # def employee
  #   @employee = Employee.find(params[:employee_id])
  #   if @employee.save
  #     redirect_to @employee, success: 'Profile created successfully!'
  #   else
  #     render :new, error: 'There was an error processing your form'
  #   end
  # end

  # def create
  #   auth = request.env["omniauth.auth"]
  #   employee = Employee.where(provider: auth['provider'], uid: auth['uid']).first || 
  #              Employee.create_with_omniauth(auth)
  #   session[:employee_id] = employee.id
  #   redirect_to root_path, success: 'Signed in!'
  # end

  # def create
  # 	auth = Employee.request.env["omniauth.auth"]
  #   employee = Employee.find_by_provider_and_uid(auth["provider"], auth["uid"]) ||
  #   Employee.create_with_omniauth(auth)
  # 	session[:employee_id] = employee.id
  # 	render text: 'Signed in!'
  # end

  def destroy
  	reset_session
  	redirect_to root_path, notice: 'Signed out!'
  end

  def failure
  	redirect_to root_path, alert: "Authentication error: #{params[:message].humanize}"
  end

  protected
  def auth_hash
    request.env['omniauth.auth']
  end
end
