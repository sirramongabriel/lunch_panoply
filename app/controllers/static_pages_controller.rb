class StaticPagesController < ApplicationController
  def index
  	@employees = Employee.all
    get_employee
  end

  def get_employee
    @employee ||= Employee.find(session[:employee_id]) if session[:employee_id]
  end
end
