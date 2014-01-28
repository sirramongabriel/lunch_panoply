require 'spec_helper'

describe EmployeesController do
  describe 'GET #index' do
    it 'returns http success and renders the :index template' do
      employee = create :employee
      get :index, company_id: employee.company_id
      expect(response).to be_success
      expect(response).to render_template :index
    end

    it 'populates an array of employees' do
      employees = []
      employee1 = create :employee
      employees << employee1 
      get :index, company_id: employee1.company_id, id: employee1.id
      expect(employees).to eq [employee1]
    end
  end

  describe 'GET #new' do
    it 'returns http success' do
      employee = create :employee
      get :new, company_id: employee.company_id, id: employee.id
      expect(response).to be_success
    end

    it 'assigns a new Employee to employee' do
      employee = create :employee
      get :new, company_id: employee.company_id, id: employee.id
      expect(assigns(:employee)).to be_a_new Employee
    end

    it 'renders the :new template' do
      employee = create :employee
      get :new, company_id: employee.company_id, id: employee.id
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    context 'given valid credentials' do
      it 'returns http success and redirects to the :show template' do
        employee = create :employee
        post :create, company_id: employee.company_id, id: employee.id, 
        employee: attributes_for(:employee)
        employee = Employee.order(:created_at).last      
        expect(response).to be_redirect
      end
    end

    context 'given invalid credentials' do
      it 'returns http client error' do
        employee = create :employee
        post :create, employee: attributes_for(:employee),
        company_id: employee.company_id, id: employee.id
        last_employee = Employee.order(:created_at).last
        last_employee.first_name = nil
        expect(last_employee).to have(1).error_on :first_name
      end

      it 'renders the :new template' do
        employee = create :employee
        post :create, company_id: employee.company_id, id: employee.id
        expect(response).to render_template :new
      end
    end
  end

  describe 'GET #show' do
    it 'returns http success and renders the :show template' do
      employee = create :employee
      get :show, company_id: employee.company_id, id: employee.id
      expect(response).to render_template :show
    end
  end

  describe 'GET #edit' do
    it 'returns http success and renders the :edit template' do
      employee = create :employee
      get :edit, company_id: employee.company_id, id: employee.id
      expect(response).to render_template :edit
    end
  end

  describe 'PUT #update' do
    context 'with valid attributes' do
      it 'locates the requested employee' do
        employee = create :employee
        put :update, company_id: employee.company_id, id: employee.id,
        employee: attributes_for(:employee)
        expect(assigns(:employee)).to eq employee
      end

      it 'changes employee attributes' do
        employee = create :employee
        put :update, company_id: employee.company_id, id: employee.id,
        employee: attributes_for(:employee, first_name: 'Billy', last_name: 'Crystal')
        employee.reload
        expect(employee.first_name).to eq 'Billy'
        expect(employee.last_name).to eq 'Crystal'
      end

      it 'redirects to the updated employee' do
        employee = create :employee
        put :update, company_id: employee.company_id, id: employee.id,
        employee: attributes_for(:employee)
        expect(response).to redirect_to company_employee_path
      end
    end

    context 'with invalid attributes' do
      it 'does not change the employee attributes' do
        employee = create :employee
        put :update, company_id: employee.company_id, id: employee.id,
        employee: attributes_for(:employee, first_name: 'John', last_name: nil)
        employee.reload
        expect(employee.first_name).not_to eq 'John'
        expect(employee.last_name).not_to eq nil
      end

      it 're-renders the :edit template' do
        employee = create :employee
        put :update, company_id: employee.company_id, id: employee.id,
        employee: attributes_for(:invalid_employee)
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes an employee from the database' do
      employee = create :employee
      expect {
              delete :destroy, company_id: employee.company_id, id: employee.id
             }.to change(Employee, :count).by(-1)
    end

    it 'successfully redirects to Employee :index template' do
      employee = create :employee
      delete :destroy, company_id: employee.company_id, id: employee.id
      expect(response).to redirect_to company_employees_path
    end 
  end
end
