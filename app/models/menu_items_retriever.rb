require 'net/http'
require 'uri'
require 'open-uri'
require 'faraday'

class MenuItemsRetriever < ActiveRecord::Base
  include HTTParty

  def initialize(filters=[])
    @filters = filters
  end

  def retrieve
    [ ]
  end

  def all
    [MenuItem.new]
    base_url = "http://devapi.zesty.com/restaurants?latitude=37.7597272&longitude=-122.418352"

    conn = Curl.get(base_url) do |curl|
      curl.headers["Accept"] = 'application/json; version=2'
      curl.headers["X-HASTY-API-KEY"] = ENV['X-HASTY-API-KEY']
      curl.verbose = true
      curl.perform
      # curl.body_str
    end

    puts conn.body_str
  end

  def gluten_free
    request = Faraday.get(
                            'http://devapi.zesty.com/restaurants?latitude=37.7597272&longitude=-122.418352',
                            { },
                            { 'Accept' => "application/json; version=2", 'X-HASTY-API-KEY' => ENV['X-HASTY-API-KEY'] }
                         )
    data = JSON.parse("#{request.body}", opts = { symbolize_names: true })
    data[:dishes][:gluten_free][:true]
  end

  def hi_protein
    request = Faraday.get(
                            'http://devapi.zesty.com/restaurants?latitude=37.7597272&longitude=-122.418352',
                            { },
                            { 'Accept' => "application/json; version=2", 'X-HASTY-API-KEY' => ENV['X-HASTY-API-KEY'] }
                         )
    data = JSON.parse(request.body, opts = { symbolize_names: true })
    data[:hi_pro]
  end

  def paleo
    request = Faraday.get(
                            'http://devapi.zesty.com/restaurants?latitude=37.7597272&longitude=-122.418352',
                            { },
                            { 'Accept' => "application/json; version=2", 'X-HASTY-API-KEY' => ENV['X-HASTY-API-KEY'] }
                         )
    data = JSON.parse(request.body, opts = { symbolize_names: true })
    data[:paleo]
  end

  def vegan
    request = Faraday.get(
                            'http://devapi.zesty.com/restaurants?latitude=37.7597272&longitude=-122.418352',
                            { },
                            { 'Accept' => "application/json; version=2", 'X-HASTY-API-KEY' => ENV['X-HASTY-API-KEY'] }
                         )
    data = JSON.parse(request.body, opts = { symbolize_names: true })
    data[:vegan]
  end

  def vegetarian
    request = Faraday.get(
                            'http://devapi.zesty.com/restaurants?latitude=37.7597272&longitude=-122.418352',
                            { },
                            { 'Accept' => "application/json; version=2", 'X-HASTY-API-KEY' => ENV['X-HASTY-API-KEY'] }
                         )
    data = JSON.parse(request.body, opts = { symbolize_names: true })
    data[:vegetarian]
  end
end
