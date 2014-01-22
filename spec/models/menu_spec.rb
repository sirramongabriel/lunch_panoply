require 'spec_helper'

describe Menu do
	it 'has a valid factory' do
		menu = create :menu
		expect(menu).to be_valid
	end
end
