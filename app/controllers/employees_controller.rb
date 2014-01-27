class EmployeesController < ApplicationController
  def index
    # get_company
    # @employee = @company.employees
    @employee = Employee.all
  end

  def new
    # get_company
    # @employee = @company.employees.build
    @employee = Employee.new
  end

  def create
    get_company
    @employee = @company.employees.build(params[:employee])
    if @employee.save
      redirect_to @employee, success: 'Employee created!'
    else
      render :new, error: 'There was an error processing your form'
    end
  end

  def show
    get_company
    @employee = @company.employees.find(params[:id])
    # @employee = Employee.find(params[:id])
  end

  def edit
    get_company 
    @employee = @company.employees.find(params[:id])
  end

  def update
    if @employee.update_attributes(params[:employee])
      redirect_to([@company, @employee], success: 'Employee successfully updated!')
    else
      render(:edit, error: 'There was an error processing your form')
    end
  end

  def destroy
  end

  private
  def get_company
    @company = Company.find(params[:company_id])
  end
end
