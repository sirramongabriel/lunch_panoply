require 'net/http'
require 'uri'
require 'open-uri'
require 'faraday'
require 'pry'

class MenuItemsRetriever < ActiveRecord::Base

  belongs_to :menu_item

  def initialize(filters=[])
    @filters = filters
  end

  def retrieve
    [ ]
  end

  def save_api_response
    conn = Faraday.new(url: 'http://devapi.zesty.com') do |c|
      c.use Faraday::Request::UrlEncoded
      c.use Faraday::Response::Logger
      c.use Faraday::Adapter::NetHttp
    end

    response = conn.get(
                          '/restaurants?latitude=37.7597272&longitude=-122.418352',
                          { },
                          { "Accept" => 'application/json; version=2', "X-HASTY-API-KEY" => ENV['X-HASTY-API-KEY']  }
                       )

    payload = JSON.parse(response.body, symbolize_names: true)
    binding.pry
    payload[:dishes]
  end

  def all
    [MenuItem.new]
    conn = Faraday.new(url: 'http://devapi.zesty.com') do |c|
      c.use Faraday::Request::UrlEncoded
      c.use Faraday::Response::Logger
      c.use Faraday::Adapter::NetHttp
    end

    response = conn.get(
                          '/restaurants?latitude=37.7597272&longitude=-122.418352',
                          { },
                          { "Accept" => 'application/json; version=2', "X-HASTY-API-KEY" => ENV['X-HASTY-API-KEY']  }
                       )

    payload = JSON.parse(response.body, symbolize_names: true)
    binding.pry
    payload[:dishes]
    # payload[:restaurants]
  end

  def gluten_free
    request = Faraday.get(
                            'http://devapi.zesty.com/restaurants?latitude=37.7597272&longitude=-122.418352',
                            { },
                            { 'Accept' => "application/json; version=2", 'X-HASTY-API-KEY' => ENV['X-HASTY-API-KEY'] }
                         )
    data = JSON.parse("#{request.body}", opts = { symbolize_names: true })
    data[:dishes][:gluten_free][true] 
  end

  def hi_protein
    request = Faraday.get(
                            'http://devapi.zesty.com/restaurants?latitude=37.7597272&longitude=-122.418352',
                            { },
                            { 'Accept' => "application/json; version=2", 'X-HASTY-API-KEY' => ENV['X-HASTY-API-KEY'] }
                         )
    data = JSON.parse(request.body, opts = { symbolize_names: true })
    data[:dishes][:hi_pro][:true]
  end

  def paleo
    request = Faraday.get(
                            'http://devapi.zesty.com/restaurants?latitude=37.7597272&longitude=-122.418352',
                            { },
                            { 'Accept' => "application/json; version=2", 'X-HASTY-API-KEY' => ENV['X-HASTY-API-KEY'] }
                         )
    data = JSON.parse(request.body, opts = { symbolize_names: true })
    data[:dishes][:paleo][:true]
  end

  def vegan
    request = Faraday.get(
                            'http://devapi.zesty.com/restaurants?latitude=37.7597272&longitude=-122.418352',
                            { },
                            { 'Accept' => "application/json; version=2", 'X-HASTY-API-KEY' => ENV['X-HASTY-API-KEY'] }
                         )
    data = JSON.parse(request.body, opts = { symbolize_names: true })
    data[:dishes][:vegan][:true]
  end

  def vegetarian
    request = Faraday.get(
                            'http://devapi.zesty.com/restaurants?latitude=37.7597272&longitude=-122.418352',
                            { },
                            { 'Accept' => "application/json; version=2", 'X-HASTY-API-KEY' => ENV['X-HASTY-API-KEY'] }
                         )
    data = JSON.parse(request.body, opts = { symbolize_names: true })
    data[:dishes][:vegetarian][:true]
  end
end
