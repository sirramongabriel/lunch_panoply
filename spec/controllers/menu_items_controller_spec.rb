require 'spec_helper'

describe MenuItemsController do
  let(:menu_item) { create :menu_item }

  describe 'GET #index' do
    it 'returns http success and renders the :index template' do
      get :index, venue_id: menu_item.venue_id, id: menu_item.id
      response.should be_success
    end
  end

  describe 'GET #create' do
    it 'returns http success' do
      get :create
      response.should be_success
    end
  end

  describe 'GET #show' do
    it 'returns http success' do
      get :show, venue_id: menu_item.venue_id, id: menu_item.id
      response.should be_success
    end
  end

  describe 'GET #destroy' do
    it 'returns http success' do
      get :destroy, venue_id: menu_item.venue_id, id: menu_item.id
      response.should be_success
    end
  end

end
