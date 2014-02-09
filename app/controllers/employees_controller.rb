class EmployeesController < ApplicationController
  before_filter :authenticate_employee!, except: [:new, :create]
  before_filter :correct_employee?, except: [:new, :create]
  before_filter :get_company

  def index
    @employee = @company.employees
  end

  def new
    @employee = @company.employees.build
  end

  def create
    @employee = @company.employees.build(params[:employee])
    if @employee.save
      redirect_to(@employee, success: 'Employee created!')
    else
      render(:new, error: 'There was an error processing your form')
    end
  end

  def show
    @employee = @company.employees.find(params[:id])
  end

  def edit
    # get_company 
    @employee = @company.employees.find(params[:id])
  end

  def update 
    @employee = @company.employees.find(params[:id])
    if @employee.update_attributes(params[:employee])
      redirect_to([@company, @employee], success: 'Employee updated!')
    else
      render(:edit, error: 'There was an error updating this form')
    end
  end

  def destroy
    @employee = @company.employees.find(params[:id])
    @employee.delete
    flash.now[:notice] = 'You sure?'
    redirect_to(company_employees_path(@company))
  end

  private
  def get_company
    @company = Company.find(params[:company_id])
  end
end
