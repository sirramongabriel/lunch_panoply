class CompaniesController < ApplicationController
  before_filter :get_company except: [:index, :new, :create]

  def index
    @companies = Company.all
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(params[:company])
    if @company.save
      redirect_to @company, success: 'Company created!'
    else
      render :new, error: 'There was an error proccessing your form'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @company.update_attributes(params[:company])
      redirect_to(@company, success: 'Company updated!')
    else
      render(:edit, error: 'There was an error updating this form')
    end
  end

  def destroy
    @company.delete
    flash.now[:notice] = 'You sure?'
    redirect_to companies_path
  end

  private
  def get_company
    @company = Company.find(params[:id])
  end
end
