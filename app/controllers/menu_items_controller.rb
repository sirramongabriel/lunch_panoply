class MenuItemsController < ApplicationController
  before_filter :get_venue, only: [:index, :create]

  def index
    # @menu_items = @venue.menu_items
    @menu_items = MenuItem.new.all

    respond_to do |format|
      format.html
      format.json { render json: { } }
    end
  end

  def new

  end

  def create
    @menu_item = MenuItem.save_api_response

    if @menu_item.save
      redirect_to([@venue, @menu_item], success: 'Venue Created!')
    else
      render(:new, error: 'There was an error processing your form')
    end
  end

  def show
  end

  def destroy
  end

  private
  def menu_items_filters
    # coerce params into menu_items_filters
    # for menu_items_retriever
  end

  def get_venue
    @venue = Venue.find(params[:venue_id])
  end 
end
