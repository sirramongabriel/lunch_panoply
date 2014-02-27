require 'net/http'
require 'uri'
require 'open-uri'
require 'faraday'

class MenuItemsRetriever  
  include HTTParty

  def initialize(filters)
    @filters = filters
  end

  def retrieve
    []
  end

  def all
    get_request

    [MenuItem.new]
    
    parse_json_response
    data[:dishes]
  end

  def gluten_free
    get_request

    parse_json_response
    data[:gluten_free]
  end

  def hi_protein
    get_request

    parse_json_response
    data[:hi_pro]
  end

  def paleo
    get_request

    parse_json_response
    data[:paleo]
  end

  def vegan
    get_request

    parse_json_response
    data[:vegan]
  end

  def vegetarian
    get_request

    parse_json_response

    data[:vegetarian]
  end

  private
  def get_request
    request = Faraday.get(
                            'http://devapi.zesty.com/restaurants?latitude=37.7597272&longitude=-122.418352',
                            { },
                            { 'Accept' => "application/json; version=2", 'X-HASTY-API-KEY' => ENV['X-HASTY-API-KEY'] }
                         )
    request
  end

  def parse_json_response(filter)
    data = JSON.parse(request.body, opts = { symbolize_names: true })
  end
end
