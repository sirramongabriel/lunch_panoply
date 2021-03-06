require 'spec_helper'

describe Venue do
	let(:venue)  { create :venue }
	let(:venues) { venues = [] }

	it 'has a valid factory' do		
		expect(venue).to be_valid
	end

	context 'with valid credentials' do
		it 'requires the presence of a venue #name' do
			expect(venue).to be_valid 
		end

		it 'requires the presence of a venue #address' do
			expect(venue).to be_valid
		end

		it 'requires the presence of a venue #city' do
			expect(venue).to be_valid
		end

		it 'requires the presnece of a venue #state' do
			expect(venue).to be_valid
		end

		it 'requires the presence of a venue #zip' do
			expect(venue).to be_valid
		end

		it 'requires the presnece of a venue #phone' do
			expect(venue).to be_valid
		end

		it 'requires that a #state is only 2 characters' do
			expect(venue).to be_valid
		end

		it 'requires that a #zip is not under 5 characters' do
			expect(venue).to be_valid
		end

		it 'requires that a #zip is not over 9 characters' do
			expect(venue).to be_valid
		end
	end

	context 'with invalid credentials' do
		it 'requires a nil venue #name to be invalid' do
			venue.name = nil
			expect(venue.name).not_to be_true
		end

		it 'requires a nil venue #address to be invalid' do
			venue.address = nil
			expect(venue.address).not_to be_true
		end

		it 'requires a nil venue #city to be invalid' do
			venue.city = nil
			expect(venue.city).not_to be_true
		end

		it 'requires a nil venue #state to be invalid' do
			venue.state = nil
			expect(venue.state).not_to be_true
		end

		it 'requires a nil venue #zip to be invalid' do
			venue.zip = nil
			expect(venue.zip).not_to be_true
		end

		it 'requires a nil venu #phone to be invalid' do
			venue.phone = nil
			expect(venue.phone).not_to be_true
		end

		it 'is invalid with a #state less than 2 characters' do
			venue.state = 'M'
			expect(venue.state.size).not_to eq 2
		end

		it 'is invalid with a #state more than 2 characters' do
			venue.state = 'TEST'
			expect(venue.state.size).not_to eq 2
		end

		it 'is invalid with a #zip less than 5 characters' do
			venue.zip = '1234'
			expect(venue.zip.size).not_to eq 5
		end

		it 'is invalid with a #zip more than 9 characters' do
			venue.zip = '123450-9878'
			expect(venue.zip.slice("-").size).not_to eq 9
		end
	end

	it 'returns the .total number of venues in a sorted list' do
		venue1 = create :venue
		venue2 = create :venue
		venue3 = create :venue
		venues << venue1 << venue2 << venue3
		expect(venues).to eq [venue1, venue2, venue3]
	end

	it 'returns a sorted list of venues .by_newest_first' do
		venue1 = build :venue
		venue2 = build :venue
		venue3 = build :venue
		venues << venue1 << venue2 << venue3
		expect(venues).to eq [venue1, venue2, venue3]
	end

	it 'returns a sorted list of venues .by_oldest_first' do
		venue1 = build :venue
		venue2 = build :venue
		venue3 = build :venue
		venues << venue1.created_at << venue2.created_at << venue3.created_at
		expect(venues).to eq [venue3.created_at, venue2.created_at, venue1.created_at]
	end

	it 'returns a sorted list of venues .by_name_asc' do
		venue3 = create :venue, name: 'Alphonzo'
		venue1 = create :venue, name: 'George'
		venue2 = create :venue, name: 'Xavior'
		venues << venue3.name << venue1.name << venue2.name
		expect(venues.sort).to eq %w(Alphonzo George Xavior)
	end

	it 'returns a sorted list of venues .by_name_desc' do
		venue2 = create :venue, name: 'Alfred'
		venue3 = create :venue, name: 'Bob'
		venue1 = create :venue, name: 'Charles'
		venues << venue2.name << venue3.name << venue1.name
		expect(venues.sort).to eq %w(Alfred Bob Charles)
	end

	it 'returns a sorted list of venues .by_city in ascending order' do
		venue1 = create :venue, city: 'Elkart'
		venue2 = create :venue, city: 'Riverside'
		venue3 = create :venue, city: 'Redlands'
		venues << venue1.city << venue2.city << venue3.city
		expect(venues.sort).to eq %w(Elkart Redlands Riverside)
	end

	it 'returns a sorted list of venues .by_state in ascending order' do
		venue1 = create :venue, state: 'MI'
		venue2 = create :venue, state: 'CA'
		venue3 = create :venue, state: 'AZ'
		venues << venue1.state << venue2.state << venue3.state
		expect(venues.sort).to eq %w(AZ CA MI)
	end

	it 'returns a sorted list of venues .by_zip in ascending order' do
		venue1 = create :venue, zip: '32125' 
		venue2 = create :venue, zip: '12345'
		venue3 = create :venue, zip: '54321'
		venues << venue1.zip << venue2.zip << venue3.zip
	  expect(venues.sort).to eq %w(12345 32125 54321)
  end
end
