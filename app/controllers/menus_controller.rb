class MenusController < ApplicationController
  before_filter :get_venue
  before_filter :get_menu, except: [:index, :new, :create]

  def index
    @menus = @venue.menu
  end

  def new
    @menu = @venue.menu.build
  end

  def create
    @menu = @venue.menu.build(params[:menu])
    if @menu.save
      redirect_to([@venue, @menu], success: 'Menu created!')
    else
      render(:new, error: 'There was an error processing your menu')
    end
  end

  def show
  end

  def edit
  end

  def update
    if @menu.update_attributes(params[:menu])
      redirect_to([@venue, @menu], success: 'Menu updated!')
    else
      render(:edit, notice: 'There was an error updating this form')
    end
  end

  def destroy
    @menu.delete
    flash.now[:notice] = 'You sure?'
    redirect_to(venue_menus_path(@venue))
  end

  private
  def get_venue
    @venue = Venue.find(params[:venue_id])
  end

  def get_menu
    get_venue
    @menu = @venue.menu.find(params[:id])
  end
end
