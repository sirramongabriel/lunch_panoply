class OmniauthCallbacksController < ApplicationController
	def facebook     
     @employee = Employee.find_for_facebook_oauth(request.env["omniauth.auth"], current_employee)      
     if @employee.persisted?       
      sign_in_and_redirect @employee, :event => :authentication #this will throw if @employee is not activated
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  def failure
    render text: 'params[:message]'
  end
end
