class CommentsController < ApplicationController
  def index
    get_employee
    @comments = @employee.comments
  end

  def new
    get_employee
    @comment = @employee.comments.build
  end

  def create
    get_employee
    @comment = @employee.comments.build(params[:comment])
    if @comment.save
      redirect_to employee_comment_path(@employee, @comment), success: 'Comment created!'
    else
      render :new, error: 'There was an error proccessing your comment'
    end
  end

  def show
    get_employee
    @comment = @employee.comments.find(params[:id])
  end

  def edit
    get_employee
    @comment = @employee.comments.find(params[:id])
  end

  def update
    get_employee
    @comment = @employee.comments.find(params[:id])
    if @comment.update_attributes(params[:comment])
      redirect_to [@employee, @comment], success: 'Comment updated!'
    else
      render :edit, notice: 'There was an error updating this form'
    end
  end

  def destroy
    get_employee
    @company = @employee.comments.find(params[:id])
    @company.delete
    flash.now[:notice] = 'Your sure?'
    redirect_to employee_comments_path(@employee)
  end

  private
  def get_employee
    @employee = Employee.find(params[:employee_id])
  end
end
