class MenuItemsController < ApplicationController
  # before_filter :get_venue, only: [:index]

  def index
    # @menu_items = MenuItem.new.all
    @venue = Venue.find(params[:venue_id])
    @menu_items = @venue.menu_items

    respond_to do |format|
      format.html
      format.json { render json: { } }
    end
  end

  def create
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
    @venue = Venue.menu_items.find(params[:venue_id])
  end
end

# curl -H 'Accept: application/json; version=2' -H 'X-HASTY-API-KEY: efdb8f7f2fe9c47e34dfe1fb7c491d0638ec2d86' 'http://devapi.zesty.com/restaurants?latitude=37.7597272&longitude=-122.418352'
