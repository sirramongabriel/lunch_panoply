require 'spec_helper'

describe CompaniesController do
  let(:company)  { create :company }

  describe 'GET #index' do
    it 'returns http success and renders the :index template' do
      get :index, id: company.id
      expect(response).to be_success
      expect(response).to render_template :index
    end

    it 'populates an array of companies' do
      companies = []
      company1 = create :company
      companies << company1
      get :index, id: company1.id
      expect(companies).to eq [company1]
    end
  end

  describe 'GET #new' do
    it 'returns http success and renders the :new template' do
      get :new, id: company.id
      expect(response).to be_success
      expect(response).to render_template :new
    end

    it 'assigns a new Company to company' do
      get :new, id: company.id
      expect(assigns(:company)).to be_a_new Company
    end
  end

  describe 'POST #create' do
    context 'given valid credentials' do
      it 'returns http success and redirects to the :show template' do
        post :create, id: company.id, company: attributes_for(:company)
        expect(response).to be_redirect
      end
    end

    context 'given invalid credentials' do
      it 'returns http client error' do
        post :create, company: attributes_for(:company),
        id: company.id
        last_company = Company.order(:created_at).last
        last_company.name = nil
        expect(last_company).to have(1).error_on :name
      end

      it 'renders the :new template' do
        post :create, id: company.id
        expect(response).to render_template :new
      end
    end
  end

  describe 'GET #show' do
    it 'returns http success and renders the :show template' do
      get :show, id: company.id
      expect(response).to be_success
      expect(response).to render_template :show
    end
  end

  describe 'GET #edit' do
    it 'returns http success and renders the :edit template' do
      get :edit, id: company.id
      expect(response).to be_success
      expect(response).to render_template :edit
    end
  end

  describe 'PUT #update' do
    context 'with valid attributes' do
      it 'returns http success and redirects to the :show template' do
        put :update, id: company.id
        expect(response).to redirect_to company_path(company.id)
      end
    end

    context 'with invalid attributes' do
      it 'does not change the company attributes' do
        put :update, id: company.id, company: attributes_for(
                                                              :company, 
                                                              name: nil, 
                                                              address: '123 clovertree',
                                                              city: 'sample city',
                                                              state: 'ts',
                                                              zip: '12345', 
                                                              phone: '11122233333'
                                                             )
        company.reload
        expect(company).not_to eq nil
        expect(company.address).not_to eq '123 clovertree'
      end

      it 're-renders the :edit template' do
        put :update, id: company.id, company: attributes_for(:invalid_company)
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes a company from the database' do
      company = create :company
      expect { delete :destroy, id: company.id }.to change(Company, :count).by(-1)
    end

    it 'successfully redirects to the Company :index template' do
      delete :destroy, id: company.id
      expect(response).to redirect_to companies_path
    end
  end
end
