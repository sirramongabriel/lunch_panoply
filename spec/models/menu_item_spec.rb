require 'spec_helper'

describe MenuItem do
	it 'has a valid factory' do
		menu_item = create :menu_item
		expect(menu_item).to be_valid
	end

	context 'with valid credentials' do
		it 'is required to contain a #title' do
			menu_item = create :menu_item
			expect(menu_item.title).to be_a String
		end

		it 'is required to contain #calories' do
			menu_item = create :menu_item
			expect(menu_item.calories).to be_a String
		end

		it 'returns calorie count provided by venue owner' do
			menu_item = create :menu_item
			menu_item.calories = '296'
			expect(menu_item.calories).to eq '296'
		end

		it 'is required to contain a #price' do
			menu_item = create :menu_item
			menu_item.price = '9.99'
			expect(menu_item.price).to eq '9.99'
		end 
	end

	context 'with invalid credentials' do
		it 'throws a validation error without a #title' do
			menu_item = build :menu_item
			menu_item.title = nil
			expect(menu_item).to have(1).error_on :title
		end

		it 'throws a validation error without #calories' do
			menu_item = build :menu_item
			menu_item.calories = nil
			expect(menu_item).to have(1).error_on :calories
		end

		it 'throws a validation error without a #price' do

		end

		it 'throws a validation error without at least one #ingredient' do

		end
	end

	subject '.total' do
		it 'returns all menu items' do

		end
	end

	subject '.by_title' do
		it 'returns a sorted array of menu items .by_title in ascending order' do

		end
	end

	subject '.by_title_reverse' do
		it 'returns a sorted array of menue items by_title in descending order' do

		end
	end

	subject '.by_ingredients' do
		it 'returns a sorted array of ingredients in ascending order' do

		end
	end

	subject '.by_ingredients_reverse' do
		it 'returns a sorted array of ingredients in descending order' do

		end
	end
end
