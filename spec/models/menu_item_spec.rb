require 'spec_helper'

describe 'MenuItem' do
	it 'has a valid factory' do
		menu_item = build :menu_item
		expect(menu_item).to be_valid
	end

	context 'with valid credentials' do
		it 'is required to contain a #name as string' do
			menu_item = build :menu_item
			expect(menu_item.name).to be_a String
		end

		it 'is required to contain #calories' do
			menu_item = build :menu_item
			expect(menu_item.calories).to be_a String
		end

		it 'returns calorie count provided by venue owner' do
			menu_item = build :menu_item
			menu_item.calories = '296'
			expect(menu_item.calories).to eq '296'
		end

		it 'is required to contain a #price' do
			menu_item = build :menu_item
			menu_item.price_cents = '899'
			expect(menu_item.price_cents).to eq '899'
		end 
	end

	context 'with invalid credentials' do
		it 'throws a validation error without a #title' do
			menu_item = build :menu_item
			menu_item.name = nil
			expect(menu_item).to have(1).error_on :name
		end

		it 'throws a validation error without #calories' do
			menu_item = build :menu_item
			menu_item.calories = nil
			expect(menu_item).to have(1).error_on :calories
		end

		it 'throws a validation error without a #price' do
			menu_item = build :menu_item
			menu_item.price_cents = nil
			expect(menu_item).to have(1).error_on :price_cents
		end
	end

	it 'returns the .total list of menu items' do
		menu_items = []
		menu_item1 = build :menu_item
		menu_item2 = build :menu_item
		menu_items << menu_item1 << menu_item2
		expect(menu_items).to eq [menu_item1, menu_item2]
	end

	it 'returns a sorted array of menu items .by_title in ascending order' do
		menu_items = []
		menu_item1 = build :menu_item
		menu_item2 = build :menu_item
		menu_item3 = build :menu_item
		menu_items << menu_item1 << menu_item2 << menu_item3
		expect(menu_items).to eq [menu_item1, menu_item2, menu_item3]
	end

	it 'returns a sorted array of menue items .by_title in descending order' do
		menu_items = []
		menu_item1 = build :menu_item
		menu_item2 = build :menu_item
		menu_item3 = build :menu_item
		menu_items << menu_item1 << menu_item2 << menu_item3
		expect(menu_items.reverse!).to eq [menu_item3, menu_item2, menu_item1]
	end

	it 'returns a sorted array of ingredients .by_ingredients in ascending' do
		ingredients = []
		menu_item = build :menu_item
		menu_item.calories = '385'
		menu_item.carbohydrates = '23'
		menu_item.protein = '19'
		ingredients << menu_item.calories << menu_item.carbohydrates << menu_item.protein
		expect(ingredients).to eq ['385', '23', '19']
	end

	it 'returns a sorted array of ingredients .by_ingredient_reverse' do
		ingredients = []
		menu_item = build :menu_item
		menu_item.calories = '385'
		menu_item.carbohydrates = '23'
		menu_item.protein = '19'
		ingredients << menu_item.calories << menu_item.carbohydrates << menu_item.protein
		expect(ingredients.reverse).to eq ['19', '23', '385']
	end
end
