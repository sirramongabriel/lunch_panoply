require 'spec_helper'

describe VenuesController do
  let(:venue) { create :venue }

  describe 'GET #index' do
    it 'returns http success and renders the :index template' do      get :index
      expect(response).to be_success
      expect(response).to render_template(:index)
    end

    it 'populates an array of venues' do
      venues = []
      venue1 = create :venue
      venues << venue1
      get :index
      expect(venues).to eq [venue1]
    end
  end

  describe 'GET #new' do
    it 'returns http success and renders the :new template' do      get :new, id: venue.id
      expect(response).to be_success
      expect(response).to render_template(:new)
    end

    it 'assigns a new Venue to venue' do      get :new, id: venue.id
      expect(assigns(:venue)).to be_a_new(Venue)
    end
  end

  describe 'POST #create' do
    context 'given valid credentials' do
      it 'returns http success and redirects to the :show template' do
        post :create, id: venue.id, venue: attributes_for(:venue)
        last_venue = Venue.order(:created_at).last
        expect(response).to be_redirect 
      end

      it 'saves the new venue in the database' do
        expect {
                  post :create,
                  venue: attributes_for(:venue, id: venue.id)
               }
      end
    end

    context 'given invalid credentials' do
      it 'returns http client error' do
        post :create, attributes_for(:venue), id: venue.id
        last_venue = Venue.order(:created_at).last
        last_venue.name = nil
        expect(last_venue).to have(1).error_on(:name)
      end

      it 'renders the :new template' do
        post :create, id: venue.id
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'GET #show' do
    it 'returns http success and renders the :show template' do      get :show, id: venue.id
      expect(response).to be_success
      expect(response).to render_template(:show)
    end
  end

  describe 'GET #edit' do
    it 'returns http success and renders the :edit template' do      get :edit, id: venue.id
      expect(response).to be_success
      expect(response).to render_template(:edit)
    end
  end

  describe 'PUT #update' do
    context 'with valid attributes' do
      it 'locates the requested venue' do
        put :update, id: venue.id, venue: attributes_for(:venue)
        expect(assigns(:venue)).to eq venue
      end

      it 'changes the venue attributes' do
        put :update, id: venue.id, venue: attributes_for(:venue, name: 'test name')
        venue.reload
        expect(venue.name).to eq 'test name'
      end

      it 'redirects to the updated venue' do
        put :update, id: venue.id, venue: attributes_for(:venue)
        expect(response).to redirect_to venue_path
      end
    end

    context 'with invalid attributes' do
      it 'does not change the venue attributes' do
        put :update, id: venue.id, venue: attributes_for(:venue, name: nil)
        venue.reload
        expect(response).not_to eq nil 
      end

      it 're-renders the :edit template' do
        put :update, id: venue.id, venue: attributes_for(:invalid_venue)
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes a venue from the database' do
      venue = create :venue
      expect {
                delete :destroy, id: venue.id
             }.to change(Venue, :count).by(-1)
    end

    it 'successfully redirects to the Venue :index template' do
      venue = create :venue
      delete :destroy, id: venue.id
      expect(response).to redirect_to venues_path
    end
  end
end
