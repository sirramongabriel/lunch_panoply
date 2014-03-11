require 'spec_helper'

describe MenuItemsController do
  # let!(:menu_item) { FactoryGirl.create(:menu_item) }
  # let(:fake_faraday_response) { "{ }" }

  describe 'GET #index' do
    it 'returns http success and renders the :index template' do
      menu_item = create :menu_item
      menu_item.venue_id = 1
      get :index, venue_id: menu_item.venue_id
      expect(response).to render_template :index
      # response.should be_success
    end

    it 'populattes an array of venues' do
      menu_items = []
      lettuce_wraps = build :menu_item
      miso_soup = build :menu_item
      basil_stuffed_chicken_breast = build :menu_item
      menu_items << lettuce_wraps << miso_soup << basil_stuffed_chicken_breast
      expect(menu_items).to eq [lettuce_wraps, miso_soup, basil_stuffed_chicken_breast] 
    end
  end

  describe 'POST #create' do
    context 'given valid credentials' do  
      it 'redirects to the :show template' do
        post :create, venue_id: menu_item.venue_id, id: menu_item.id,
        menu_item: attributes_for(:menu_item)
        menu_item = MenuItem.order(:created_at).last
        expect(response).to redirect_to venue_menu_item_path(venue_id: menu_item.venue_id, id: menu_item.id)
      end
    end

    context 'given invalid credentials' do
      it 'returns http client error' do
        post :create, venue_id: menu_item.venue_id, id: menu_item.id,
        menu_item: attributes_for(:menu_item)
        sample_menu_item = MenuItem.order(:created_at).last
        sample_menu_item.name = nil
        expect(sample_menu_item).to have(1).error_on :name
      end

      it 'renders the :new template' do
        post :create, venue_id: menu_item.venue_id, id: menu_item.id
        expect(response).to render_template :new
      end
    end
  end

  describe 'GET #show' do
    it 'returns http success and renders the :edit template' do
      menu_item = FactoryGirl.build(:menu_item)
      get :show, venue_id: menu_item.venue_id, id: menu_item.id
      expect(response).to render_template :show
      response.should be_success
    end
  end

  # describe 'DELETE #destroy' do
  #   it 'deletes an employee from the database' do
  #     menu_items = []
  #     menu_item = "build :menu_item"
  #     menu_items << menu_item
  #     expect {
  #               delete :destroy, venue_id: menu_item.venue_id, id: menu_item.id
  #            }.to change(menu_items, :count).by(-1)
  #   end

  #   it 'redirects to the :index template' do
  #     delete :destroy, venue_id: menu_item.venue_id, id: menu_item.id
  #     expect(response).to redirect_to menu_items_path(venue_id: menu_item.venue_id)
  #   end
  # end
end
