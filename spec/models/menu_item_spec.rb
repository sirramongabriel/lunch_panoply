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
			menu_item = create :menu_item
			menu_item.title = nil
			expect(menu_item).to have(1).error_on :title
		end

		it 'throws a validation error without #calories' do
			menu_item = create :menu_item
			menu_item.calories = nil
			expect(menu_item).to have(1).error_on :calories
		end

		it 'throws a validation error without a #price' do
			menu_item = create :menu_item
			menu_item.price = nil
			expect(menu_item).to have(1).error_on :price
		end

		it 'throws a validation error without at least one #ingredient' do
			menu_item = create :menu_item
			menu_item.ingredient1 = nil
			expect(menu_item).to have(1).error_on :ingredient1
		end
	end

	it 'returns the .total list of menu items' do
		menu_items = []
		menu_item1 = create :menu_item
		menu_item2 = create :menu_item
		menu_items << menu_item1 << menu_item2
		expect(menu_items).to eq [menu_item1, menu_item2]
	end

	it 'returns a sorted array of menu items .by_title in ascending order' do
		menu_items = []
		menu_item1 = create :menu_item
		menu_item2 = create :menu_item
		menu_item3 = create :menu_item
		menu_items << menu_item1 << menu_item2 << menu_item3
		expect(menu_items).to eq [menu_item1, menu_item2, menu_item3]
	end

	it 'returns a sorted array of menue items .by_title in descending order' do
		menu_items = []
		menu_item1 = create :menu_item
		menu_item2 = create :menu_item
		menu_item3 = create :menu_item
		menu_items << menu_item1 << menu_item2 << menu_item3
		expect(menu_items.reverse!).to eq [menu_item3, menu_item2, menu_item1]
	end

	it 'returns a sorted array of ingredients .by_ingredients in ascending' do
		ingredients = []
		menu_item = create :menu_item
		menu_item.ingredient1 = 'chicken'
		menu_item.ingredient2 = 'beef'
		menu_item.ingredient3 = 'turkey'
		ingredients << menu_item.ingredient1 << menu_item.ingredient2 << menu_item.ingredient3
		expect(ingredients).to eq ['chicken', 'beef', 'turkey']
	end

	it 'returns a sorted array of ingredients .by_ingredient_reverse' do
		ingredients = []
		menu_item = create :menu_item
		menu_item.ingredient1 = 'chicken'
		menu_item.ingredient2 = 'beef'
		menu_item.ingredient3 = 'turkey'
		ingredients << menu_item.ingredient1 << menu_item.ingredient2 << menu_item.ingredient3
		expect(ingredients.reverse).to eq ['turkey', 'beef', 'chicken']
	end
end
