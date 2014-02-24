require 'net/http'
require 'uri'
require 'open-uri'
require 'httparty'
require 'json'

class MenuItemsController < ApplicationController
  def index
    # MenuItemsRetriever for adapter pattern
    # @menu_items = MenuItemsRetriever.retrieve 

    # uri = URI.parse("http://devapi.zest.com/")

    # http = Net::HTTP.new(uri.host, uri.port)
    # request = Net::HTTP::Get.new(uri.request_uri)
    # request.basic_auth("Accept: 'application/json; version=2", "ENV['X-HASTY-API-KEY']")

    # response = http.request(request)

    uri = URI('http://devapi.zesty.com/restaurants?latitude=37.7597272&longitude=-122.418352')
    params = {limit: 1 }
    uri.query = URI.encode_www_form(params)

    response = Net::HTTP.get_response(uri)

    @response = response.body

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

end

# curl -H 'Accept: application/json; version=2' -H 'X-HASTY-API-KEY: efdb8f7f2fe9c47e34dfe1fb7c491d0638ec2d86' 'http://devapi.zesty.com/restaurants?latitude=37.7597272&longitude=-122.418352'
