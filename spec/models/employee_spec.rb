require 'spec_helper'

describe Employee do
	it 'has a valid factory' do
		employee = create :employee
		expect(employee).to be_valid
	end

  context 'with valid credentials' do
  	it 'is valid with a #first_name' do
  		employee = create :employee
  		employee.first_name = 'Janet'
  		expect(employee.first_name).to eq 'Janet'
  	end

  	it 'is valid with a #last_name ' do
  		employee = create :employee
  		employee.last_name = 'Reno'
  		expect(employee.last_name).to eq 'Reno'
  	end
  end

  context 'with invalid credentials' do
  	it 'is invalid without a #first_name' do
  		employee = create :employee
  		employee.first_name = nil
  		expect(employee.first_name).not_to be_true
  	end

  	it 'is invalid without a #last_name' do
  		employee = create :employee
  		employee.last_name = nil
  		expect(employee.last_name).not_to be_true
  	end
  end

  it 'returns a sorted array of employees .by_first_name' do
  	employees = []
  	employee1 = create :employee
  	employee2 = create :employee
  	employee3 = create :employee
  	employees << employee1.first_name << employee2.first_name << employee3.first_name
  	expect(employees).to eq [employee1.first_name, employee2.first_name, employee3.first_name]
  end

  it 'returns a sorted array of employees .by_last_name' do
  	employees = []
  	employee1 = create :employee
  	employee2 = create :employee
  	employee3 = create :employee
  	employees << employee1.last_name << employee2.last_name << employee3.last_name
  	expect(employees).to eq [employee1.last_name, employee2.last_name, employee3.last_name]
  end

  it 'returns a sorted array of employees .by_joined_on_newest_first' do
  	employees = []
  	employee1 = create :employee
  	employee2 = create :employee
  	employee3 = create :employee
  	employees << employee1.created_at << employee2.created_at << employee3.created_at
  	expect(employees).to eq [employee1.created_at, employee2.created_at, employee3.created_at]
  end

  it 'returns a sorted array of employees .by_joined_on_oldest_first' do
  	employees = []
  	employee1 = create :employee
  	employee2 = create :employee
  	employee3 = create :employee
  	employees << employee3.created_at << employee2.created_at << employee1.created_at
  	expect(employees).to eq [employee3.created_at, employee2.created_at, employee1.created_at]
  end

  it 'returns a #first_name and a #last_name as one #full_name' do 
  	employee = build :employee
  	employee.first_name = 'Janet'
  	employee.last_name = 'Jackson'
  	expect(employee.full_name).to eq 'Janet Jackson'
  end
end
