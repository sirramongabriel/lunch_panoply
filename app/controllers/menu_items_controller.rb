class MenuItemsController < ApplicationController
  before_filter :get_venue, only: [:index, :create]

  def index
    @menu_items = @venue.menu_items

    respond_to do |format|
      format.html
      format.json { render json: { } }
    end
  end

  # def new
  #   @menu_item = MenuItemsRetriever.
  # end

  def results
    @menu_item                 = MenuItem.new(params[:menu_item])
    @menu_item.name            = payload[:dishes][:name]
    @menu_item.calories        = payload[:dishes][:calories]
    @menu_item.course          = payload[:dishes][:course]
    @menu_item.description     = payload[:dishes][:description]
    @menu_item.carbohydrates   = payload[:dishes][:carbohydrates]
    @menu_item.protein         = payload[:dishes][:protein]
    @menu_item.fat             = payload[:dishes][:fat]
    @menu_item.vegetarian      = payload[:dishes][:vegetarian]
    @menu_item.paleo           = payload[:dishes][:paleo]
    @menu_item.vegan           = payload[:dishes][:vegan]
    @menu_item.gluten_free     = payload[:dishes][:gluten_free]
    @menu_item.bal             = payload[:dishes][:bal]
    @menu_item.low_cal         = payload[:dishes][:low_cal]
    @menu_item.low_carb        = payload[:dishes][:low_carb]
    @menu_item.low_fat         = payload[:dishes][:low_fat]
    @menu_item.hi_protein      = payload[:dishes][:hi_protein]
    @menu_item.price_cents     = payload[:dishes][:price_cents]
    @menu_item.full_image_path = payload[:dishes][:full_image_path]
    @menu_items.api_dish_id    = payload[:dishes][:api_dish_id]
    @menu_item.api_venue_id    = payload[:dishes][:api_venue_id] 
  end

  def create
    @menu_items = MenuItemsRetriever.new
    # @menu_items.results.each_with_index do |key, val|
    #   menu_item[:key][:val].save
    # end

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

# curl -H 'Accept: application/json; version=2' -H 'X-HASTY-API-KEY: efdb8f7f2fe9c47e34dfe1fb7c491d0638ec2d86' 'http://devapi.zesty.com/restaurants?latitude=37.7597272&longitude=-122.418352'
