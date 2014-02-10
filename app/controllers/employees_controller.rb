class EmployeesController < ApplicationController
  before_filter :authenticate_employee!, except: [:new, :create]
  before_filter :correct_employee?, except: [:new, :create]

  def index
    @employees = Employee.all
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(params[:employee])
    if @employee.save
      redirect_to(employee_path(@employee), success: 'Employee created!')
    else
      render(:new, error: 'There was an error processing your form')
    end
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def update 
    @employee = Employee.find(params[:id])
    if @employee.update_attributes(params[:employee])
      redirect_to([@company, @employee], success: 'Employee updated!')
    else
      render(:edit, error: 'There was an error updating this form')
    end
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.delete
    flash.now[:notice] = 'You sure?'
    redirect_to(company_employees_path(@company))
  end
end
