require 'net/http'
require 'uri'

class MenuItemsController < ApplicationController
  def index
    # @menu_items = MenuItemsRetriever.new(menu_items_filters).retrieve

    @uri = URI.parse("-H 'Accept: application/json; version=2' -H 'X-HASTY-API-KEY: efdb8f7f2fe9c47e34dfe1fb7c491d0638ec2d86' 'http://devapi.zesty.com/restaurants?latitude=37.7597272&longitude=-122.418352")



    respond_to do |format|
      format.html 
      format.json { render json: {  } }
    end
   

    # uri_for_area = URI(
    #                     -H 'Accept: application/json; version=2' 
    #                     -H 'X-HASTY-API-KEY: ' 
    #                     'http://devapi.zesty.com/restaurants?latitude=37.7597272&longitude=-122.418352'
    #                   )

    # uri_for_menu_items = URI(
    #                           -H 'Accept: application/json; version=2' 
    #                           -H 'X-HASTY-API-KEY: ' 
    #                           'http://devapi.zesty.com/restaurants/52e069411114738a09000001/dishes'
    #                         )

    # response = Net::HTTP.get_resonse(uri)

    # uri = URI.parse('devapi.zesty.com')
    # response = http.request_head('devapi.zesty.com')
    # respond_with

    # api_base_url = 'http://devapi.zesty.com/restaurants'
    # uri = URI("#{ api_base_url }?latitude=37.7597272&longitude=-122.418352")

    # @menu_items = MenuItems.all
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

end

# curl -H 'Accept: application/json; version=2' -H 'X-HASTY-API-KEY: efdb8f7f2fe9c47e34dfe1fb7c491d0638ec2d86' 'http://devapi.zesty.com/restaurants?latitude=37.7597272&longitude=-122.418352'
