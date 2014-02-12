require 'spec_helper'

describe EmployeesController do
  let (:employee)  { create :employee }

  describe 'GET #index' do
    it 'returns http success and renders the :index template' do
      get :index
      expect(response).to render_template :index
      expect(response).to be_success
    end

    it 'populates an array of employees' do
      employees = []
      employee1 = create :employee
      employees << employee1 
      get :index, id: employee1.id
      expect(employees).to eq [employee1]
    end
  end

  describe 'GET #new' do
    it 'returns http success' do
      get :new, id: employee.id
      expect(response).to be_success
    end

    it 'assigns a new Employee to employee' do
      get :new, id: employee.id
      expect(assigns(:employee)).to be_a_new Employee
    end

    it 'renders the :new template' do
      get :new, id: employee.id
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    context 'given valid credentials' do
      it 'redirects to the :show template' do
        post :create, id: employee.id, 
        employee: attributes_for(:employee)
        employee = Employee.order(:created_at).last      
        expect(response).to redirect_to employee_path(id: employee.id)
      end
    end

    context 'given invalid credentials' do
      it 'returns http client error' do
        post :create, employee: attributes_for(:employee), id: employee.id
        last_employee = Employee.order(:created_at).last
        last_employee.first_name = nil
        expect(last_employee).to have(1).error_on :first_name
      end

      it 'renders the :new template' do
        post :create, id: employee.id
        expect(response).to render_template :new
      end
    end
  end

  describe 'GET #show' do
    it 'returns http success and renders the :show template' do
      get :show, id: employee.id
      expect(response).to render_template :show
    end
  end

  describe 'GET #edit' do
    it 'returns http success and renders the :edit template' do
      get :edit, id: employee.id
      expect(response).to render_template(:edit)
    end
  end

  describe 'PUT #update' do
    context 'with valid attributes' do
      it 'locates the requested employee' do
        put :update, id: employee.id,
        employee: attributes_for(:employee)
        expect(assigns(:employee)).to eq employee
      end

      it 'changes employee attributes' do
        put :update, id: employee.id,
        employee: attributes_for(:employee, first_name: 'Billy', last_name: 'Crystal')
        employee.reload
        expect(employee.first_name).to eq 'Billy'
        expect(employee.last_name).to eq 'Crystal'
      end

      it 'redirects to the updated employee' do
        put :update, id: employee.id,
        employee: attributes_for(:employee)
        expect(response).to redirect_to employee_path(id: employee.id)
      end
    end

    context 'with invalid attributes' do
      it 'does not change the employee attributes' do
        put :update, id: employee.id,
        employee: attributes_for(:employee, first_name: 'John', last_name: nil)
        employee.reload
        expect(employee.first_name).not_to eq 'John'
        expect(employee.last_name).not_to eq nil
      end

      it 're-renders the :edit template' do
        put :update, id: employee.id,
        employee: attributes_for(:invalid_employee)
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes an employee from the database' do
      employee = create :employee
      expect {
              delete :destroy, id: employee.id
             }.to change(Employee, :count).by(-1)
    end

    it 'successfully redirects to the Employee :index template' do
      delete :destroy, id: employee.id
      expect(response).to redirect_to employees_path
    end 
  end
end
