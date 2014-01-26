require 'spec_helper'

describe Company do
	it 'has a valid factory' do
		company = build :company
		expect(company).to be_valid
	end

	it 'returns a .total number of companies' do
		companies = []
		company1 = build :company
		company2 = build :company
		companies << company1 << company2
		expect(companies.size).to eq 2
	end

	it 'does not return a number less than .total number of companies' do
		companies = []
		company1 = build :company
		company2 = build :company
		companies << company1 << company2
		expect(companies.size).not_to eq 1
	end

	it 'should return all companies .by_name in ascending order' do
		companies = []
		company1 = build :company, name: 'harold'
		company2 = build :company, name: 'johnny'
		company3 = build :company, name: 'eldridge'
		companies << company1.name << company2.name << company3.name
		expect(companies.sort!).to eq ['eldridge', 'harold', 'johnny']
	end

	it 'returns a sorted array of companies .by_oldest_first' do
		companies = []
		company1 = build :company
		company2 = build :company
		company3 = build :company
		companies << company1 << company2 << company3
		expect(companies).to eq [company1, company2, company3]
	end

	it 'returns a sorted array of companies .by_newest_first' do
		companies = []
		company1 = build :company
		company2 = build :company
		company3 = build :company
		companies << company1 << company2 << company3
		companies.reverse!
		expect(companies).to eq [company3, company2, company1]
	end

	it 'returns a sorted array of companys .by_city' do
		companies = []
		company1 = build :company
		company2 = build :company
		company3 = build :company
		companies << company1.city << company2.city << company3.city
		expect(companies).to eq [company1.city, company2.city, company3.city]
	end

	context 'with valid credentials' do
 		it 'is valid with a #name' do
 			company = build :company, name: 'sample name'
 			expect(company.name).to eq 'sample name'
 		end

 		it 'is valid with an #address' do
 			company = build :company, address: '123 sample avenue'
 			expect(company.address).to eq '123 sample avenue'
 		end

 		it 'is valid with a #city' do
 			company = build :company, city: 'sample city'
 			expect(company.city).to eq 'sample city'
 		end

 		it 'is valid with a #state' do
 			company = build :company, state: 'TS'
 			expect(company.state).to eq 'TS'
 		end

 		it 'is valid with a #zip' do 
 			company = build :company, zip: '11111'
 			expect(company.zip).to eq '11111'
 		end

 		it 'requires a #zip to have a length >= 5' do
	 		company = build :company, zip: '12345'
	 		expect(company.zip.size).to eq 5 
	 	end

 		it 'is valid with a #phone' do
 			company = build :company, phone: '111-555-1212'
 			expect(company.phone).to eq '111-555-1212'
 		end

 		it 'requires a #phone length to be 10' do
 			company = build :company, phone: '111-555-1212'
 			expect(company.phone.gsub!('-', '').size).to eq 10
 		end
 	end

 	context 'with invalid credentials' do
	 	it 'is invalid without a #name' do
	 		company = build :company, name: nil
	 		expect(company.name).not_to be_true
	 	end

	 	it 'is invalid without an #address' do
	 		company = build :company, address: nil
	 		expect(company.address).not_to be_true
	 	end

	 	it 'is invalid without a #city' do
	 		company = build :company, city: nil
	 		expect(company.city).not_to be_true
	 	end

	 	it 'is invalid without a #state' do
	 		company = build :company, state: nil
	 		expect(company.state).not_to be_true
	 	end

	 	it 'is invalid without a #zip' do 
	 		company = build :company, zip: nil
	 		expect(company.zip).not_to be_true
	 	end

	 	it 'is invalid with a #zip length less than 5' do
	 		company = build :company, zip: '1234'
	 		expect(company.zip.size).not_to eq 5
	 	end

	 	it 'is invalid without a #phone' do
	 		company = build :company, phone: nil
	 		expect(company.phone).not_to be_true
	 	end

	 	it 'is invalid with a #phone length less than 10' do
	 		company = build :company, phone: '123-456-787'
	 		expect(company.phone.gsub!('-', '').size).not_to eq 10
	 	end
	end
end
