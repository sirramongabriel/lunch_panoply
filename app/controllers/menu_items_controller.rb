require 'net/http'
require 'uri'

class MenuItemsController < ApplicationController
  def index
    uri = URI.parse('devapi.zesty.com')
    response = http.request_head('devapi.zesty.com')

    respond_with
  end

  def create
  end

  def show
  end

  def destroy
  end
end
