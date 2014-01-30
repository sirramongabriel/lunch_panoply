class StaticPagesController < ApplicationController
  def index
  	@employees = Employee.all
  end
end
