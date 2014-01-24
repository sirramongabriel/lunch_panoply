require 'spec_helper'

describe Venue do
	it 'has a valid factory' do
		venue = create :venue
		expect(venue).to be_valid
	end

	context 'with valid credentials' do
		it 'requires the presence of a venue #name'

		it 'requires the presence of a venue #address'

		it 'requires the presence of a venue #city'

		it 'requires the presnece of a venue #state'

		it 'requires the presence of a venue #zip'

		it 'requires the presnece of a venue #phone'

		it 'requires that a #state is only 2 characters'

		it 'requires that a #zip is not under 5 characters'

		it 'requires that a #zip is not over 9 characters'
	end

	context 'with invalid credentials' do
		it 'requires a nil venue #name to be invalid'

		it 'requires a nil venue #address to be invalid'

		it 'requires a nil venue #city to be invalid'

		it 'requires a nil venue #state to be invalid'

		it 'requires a nil venue #zip to be invalid'

		it 'requires a nil venu #phone to be invalid'

		it 'is invalid with a #state less than 2 characters'

		it 'is invalid with a #state more than 2 characters'

		it 'is invalid with a #zip less than 5 characters'

		it 'is invalid with a #zip more than 9 characters'
	end

	it 'returns the .total number of venues in a sorted list'

	it 'returns a sorted list of venues .by_newest_first'

	it 'returns a sorted list of venues .by_oldest_first'

	it 'returns a sorted list of venues .by_name_asc'

	it 'returns a sorted list of venues .by_name_desc'

	it 'returns a sorted list of venues .by_city in ascending order'

	it 'returns a sorted list of venues .by_state in ascending order'

	it 'returns a sorted list of venues .by_zip in ascending order'
end
