class CommentsController < ApplicationController
  before_filter :get_employee

  def index
    @comments = @employee.comments
  end

  def new
    @comment = @employee.comments.build
  end

  def create
    @comment = @employee.comments.build(params[:comment])
    if @comment.save
      redirect_to(employee_comment_path(@employee, @comment), success: 'Comment created!')
    else
      render(:new, error: 'There was an error proccessing your comment')
    end
  end

  def show
    @comment = @employee.comments.find(params[:id])
  end

  def edit
    @comment = @employee.comments.find(params[:id])
  end

  def update
    @comment = @employee.comments.find(params[:id])
    if @comment.update_attributes(params[:comment])
      redirect_to([@employee, @comment], success: 'Comment updated!')
    else
      render(:edit, notice: 'There was an error updating this form')
    end
  end

  def destroy
    @company = @employee.comments.find(params[:id])
    @company.delete
    flash.now[:notice] = 'Your sure?'
    redirect_to(employee_comments_path(@employee))
  end

  private
  def get_employee
    @employee = Employee.find(params[:employee_id])
  end

  # def get_company
  #   @company = @employee.comments.find(params[:id])
  # end
end
