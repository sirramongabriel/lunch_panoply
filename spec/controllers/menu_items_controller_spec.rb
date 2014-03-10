require 'spec_helper'

describe MenuItemsController do
  let(:menu_item) { create :menu_item }

  describe 'GET #index' do
    it 'returns http success and renders the :index template' do
      get :index, venue_id: menu_item.venue_id, id: menu_item.id
      expect(response).to render_template :index
      response.should be_success
    end

    it 'populattes an array of venues' do

    end
  end

  describe 'GET #create' do
    context 'given valid credentials' do  
      it 'redirects to the :show template' do
        get :create
        response.should be_success
      end
    end

    context 'given invalid credentials' do
      it 'returns http client error' do

      end

      it 'renders the :new template' do

      end
    end
  end

  describe 'GET #show' do
    it 'returns http success and renders the :edit template' do
      get :show, venue_id: menu_item.venue_id, id: menu_item.id
      expect(response).to render_template :show
      response.should be_success
    end
  end

  describe 'GET #destroy' do
    it 'deletes an employee from the database' do
      get :destroy, venue_id: menu_item.venue_id, id: menu_item.id
      response.should be_success
    end

    it 'redirects to the :index template' do
    end
  end

end
