require 'spec_helper'

describe Company do
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
