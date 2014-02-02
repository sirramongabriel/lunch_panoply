class VenuesController < ApplicationController
  def index
    @venues = Venue.all
  end

  def new
    @venue = Venue.new
  end

  def create
    @venue = Venue.new(params[:venue])
    if @venue.save
      redirect_to(@venue, success: 'Venue added!')
    else
      render(:new, error: 'There was an error processing your Venue')
    end
  end

  def show
    @venue = Venue.find(params[:id])
  end

  def edit
    @venue = Venue.find(params[:id])
  end

  def update
    @venue = Venue.find(params[:id])
    if @venue.update_attributes(params[:venue])
      redirect_to(@venue, success: 'Venue updated!')
    else
      render(:edit, error: 'There was an error updating your Venue')
    end
  end

  def destroy
    @venue = Venue.find(params[:id])
    @venue.delete
    flash.now[:notice] = 'You sure?'
    redirect_to(venues_path)
  end
end
