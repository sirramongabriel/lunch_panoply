require 'spec_helper'

describe EmployeesController do
  let(:employee) { FactoryGirl.create :employee }
  describe 'GET #index' do
    it 'returns http success' do
      get :index
      response.should be_success
    end

    it 'populates an array of employees' do
      employees = []
      employee1 = create :employee
      employee2 = create :employee
      employee3 = create :employee
      employees << employee1 << employee2 << employee3
      get :index
      expect(employees).to eq [employee1, employee2, employee3]
    end

    it 'renders the :index template' do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #new' do
    it 'returns http success' do
      employee = create :employee
      get :new, company_id: employee.company_id, id: employee.id
      response.should be_success
    end

    it 'assigns a new Employee to @employee' do
      get :new, company_id: employee.company_id, id: employee.id
      expect(employee).to be_a_kind_of Employee
    end

    it 'renders the :new template' do
      get :new, company_id: employee.company_id, id: employee.id
      expect(response).to render_template(:new)
    end
  end

  describe 'GET #create' do
    context 'given valid credentials' do
      it 'returns http success and redirects to the :show template' do
        get :create, employee: FactoryGirl.attributes_for(:employee),
        company_id: employee.company_id, id: employee.id
        employee = Employee.order(:created_at).last      
        expect(response).to be_redirect
      end
    end

    context 'given invalid credentials' do
      it 'returns http client error' do
        post :create, employee: FactoryGirl.attributes_for(:employee),
        company_id: employee.company_id, id: employee.id
        employee = Employee.order(:created_at).last
        expect(response).not_to be_success
      end

      it 'should render the :new template' do
        post :create, company_id: employee.company_id, id: employee.id
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'GET #show' do
    it 'returns http success and renders the :show template' do
      get :show, company_id: employee.company_id, id: employee.id
      expect(response).to render_template(:show)
      expect(response).to be_success
    end
  end

  describe 'GET #edit' do
    it 'returns http success and render the :edit template' do
      get :edit, company_id: employee.company_id, id: employee.id
      expect(response).to render_template(:edit)
    end
  end

  describe 'GET #update' do
    it 'returns http success and redirects to the :show template' do
      get :update, company_id: employee.company_id, id: employee.id
      expect(response).to be_redirect
      response.should be_success
    end
  end

  describe 'GET #destroy' do
    it 'returns http success' do
      get :destroy
      response.should be_success
    end
  end
end
