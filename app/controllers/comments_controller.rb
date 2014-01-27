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
    # get_employee
    # @comment = @employees.comments.build(params[:comment])
    @comment = Comment.new(params[:comment])
    if @comment.save
      redirect_to @comment, success: 'Comment created!'
    else
      render :new, error: 'There was an error proccessing your comment'
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def get_employee
    @employee = Employee.find(params[:id])
  end
end
