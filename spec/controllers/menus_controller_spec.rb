require 'spec_helper'

describe MenusController do
  let(:menu) { create :menu }

  describe 'GET #index' do   
    it 'returns http success and renders the :index template' do
      get :index, employee_id: menu.venue_id, id: menu.id
      expect(response).to render_template(:index)
      expect(response).to be_success
    end
  end

  describe 'GET #new' do
    before(:each) { get :new, venue_id: menu.venue_id, id: menu.id }
    
    it 'returns http success and renders the :new template' do
      expect(response).to render_template(:new)
      expect(response).to be_success
    end

    it 'assigns a new Menu to menu' do
      expect(assigns(:menu)).to be_a_new(Menu)
    end
  end

  describe 'GET #create' do
    before(:each) {
                    post :create, 
                    venue_id: menu.venue_id,
                    id: menu.id,
                    menu: attributes_for(:menu)
                  }
    context 'given valid credentials' do
      it 'returns http success and redirects to the :show template' do
        get :create
        expect(response).to 
        redirect_to venue_menu_path(
                                    venue_id: menu.venue_id, 
                                    id: menu.id
                                   )
      end

      # it 'saves the new menu object in the database' do
      #   expect {
      #             post :create,
      #             comment: attributes_for(:comment, 
      #             venue_id: menu.venue_id, id: menu.id).to change(Menu, :count).by(1)
                                         
      #          }
      # end
    end

    context 'given invalid credentials' do
      it 'returns http client error' do
        menu = Menu.order(:created_at).last
        menu.venue_id = nil
        expect(menu).to have(1).error_on(:venue_id)
      end

      it 'renders the :new template' do
        post :create, venue_id: menu.venue_id, id: menu.id
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'GET #show' do
    before(:each) { get :show, venue_id: menu.venue_id, id: menu.id }

    it 'returns http success and renders the :show template' do
      expect(response).to be_success
      expect(response).to render_template(:show)
    end
  end

  describe 'GET #edit' do
    before(:each) { get :edit, venue_id: menu.venue_id, id: menu.id }

    it 'returns http success and renders the :edit template' do
      expect(response).to render_template(:edit)
      expect(response).to be_success
    end
  end

  # describe 'GET #update' do
  #   before(:each) { 
  #                   put :update, 
  #                   venue_id: menu.venue_id,
  #                   id: menu.id,
  #                   menu: attributes_for(:menu)
  #                 }

  #   context 'with valid attributes' do
  #     it 'locates the requested menu' do
  #       expect(assigns(:menu)).to eq menu
  #     end

  #     it 'changes the menu attributes' do
  #       put :update, venue_id: menu.venue_id, id: menu.id,
  #       menu: attributes_for(:menu)
  #       menu.reload
  #       expect(attributes_for(:menu)).to be_valid
  #     end

  #     it 'redirects to the updated menu' do
  #       expect(response).to redirect_to venue_menu_path
  #     end
  #   end

  #   context 'with invalid attributes' do
  #     it 'does not change the menu_'
  #   end
  # end

  # describe 'GET #destroy' do
  #   it 'deletes a menu from the database' do
  #     menu = create :menu
  #     expect {
  #              delete :destroy, 
  #              venue_id: menu.venue_id,
  #              id: menu.id
  #            }.to change(Menu, :count).by(-1)
  #   end
  # end
end
