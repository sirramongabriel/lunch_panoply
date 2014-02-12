require 'spec_helper'

describe Company do
	let(:companies) { companies = [] }
	let(:company)   { create :company }

	# it 'should have many employees' do
	# 	e = Company.reflect_on_association(:employees)
	# 	expect(e.macro).to eq :has_many
	# end

	it 'has a valid factory' do
		expect(company).to be_valid
	end

	it 'returns a .total number of companies' do
		company1 = build :company
		company2 = build :company
		companies << company1 << company2
		expect(companies.size).to eq 2
	end

	it 'does not return a number less than .total number of companies' do
		company1 = build :company
		company2 = build :company
		companies << company1 << company2
		expect(companies.size).not_to eq 1
	end

	it 'should return all companies .by_name in ascending order' do
		company1 = build :company, name: 'harold'
		company2 = build :company, name: 'johnny'
		company3 = build :company, name: 'eldridge'
		companies << company1.name << company2.name << company3.name
		expect(companies.sort!).to eq ['eldridge', 'harold', 'johnny']
	end

	it 'returns a sorted array of companies .by_oldest_first' do
		company1 = build :company, created_at: (Time.now - 1.hour.ago)
		company2 = build :company, created_at: (Time.now - 4.hours.ago)
		company3 = build :company, created_at: (Time.now - 2.days.ago)
		companies << company1 << company2 << company3
		companies.sort! { |x, y| y.created_at <=> x.created_at }
		expect(companies).to eq [company3, company2, company1]
	end

	it 'returns a sorted array of companies .by_newest_first' do
		company1 = build :company, created_at: (Time.now - 1.hour.ago)
		company2 = build :company, created_at: (Time.now - 4.hours.ago)
		company3 = build :company, created_at: (Time.now - 2.days.ago)
		companies << company1 << company2 << company3
		companies.sort! { |x, y| x.created_at <=> y.created_at }
		expect(companies).to eq [company1, company2, company3]
	end

	it 'returns a sorted array of companys .by_city' do
		company1 = build :company, city: 'san diego'
		company2 = build :company, city: 'albuquerque'
		company3 = build :company, city: 'chattanooga'
		companies << company1.city << company2.city << company3.city
		companies.sort! { |x, y| x[0] <=> y[0] }
		expect(companies).to eq [company2.city, company3.city, company1.city]
	end

	context 'with valid credentials' do
	 	it { should allow_mass_assignment_of(:address) }

	 	it { should validate_presence_of(:address) }

 		it { should allow_mass_assignment_of(:city) }

 		it { should validate_presence_of(:city) }

 		it { should allow_mass_assignment_of(:state) }

 		it { should validate_presence_of(:state) }

 		it { should allow_mass_assignment_of(:zip) }

 		it { should validate_presence_of(:zip) }


 		it 'requires a #zip to have a length greater than or equal to 5 characters' do
	 		company.zip = '12345'
	 		expect(company.zip.size).to eq 5 
	 	end

	 	it { should validate_presence_of(:phone) }

	 	it { should ensure_length_of(:phone).is_equal_to(10)}
 	end

 	context 'with invalid credentials' do
	 	it 'is invalid without the presence of a #name' do
	 		company.name = nil
	 		expect(company.name).not_to be_true
	 	end

	 	it 'is invalid without the presence of an #address' do
	 		company.address = nil
	 		expect(company.address).not_to be_true
	 	end

	 	it 'is invalid without the presence of a #city' do
	 		company.city = nil
	 		expect(company.city).not_to be_true
	 	end

	 	it 'is invalid without the presence of a #state' do
	 		company.state = nil
	 		expect(company.state).not_to be_true
	 	end

	 	it 'is invalid without the presence of a #zip' do 
	 		company.zip = nil
	 		expect(company.zip).not_to be_true
	 	end

	 	it 'is invalid when the presence of a #zip code length is less than 5 characters' do
	 		company.zip = '1234'
	 		expect(company.zip.size).not_to eq 5
	 	end

	 	it 'is invalid without the presence of a #phone' do
	 		company.phone = nil
	 		expect(company.phone).not_to be_true
	 	end

	 	it 'is invalid when the presence of a #phone number length of less than 10 characters' do
	 		company.phone = '123-456-787'
	 		expect(company.phone.gsub!('-', '').size).not_to eq 10
	 	end
	end
end
