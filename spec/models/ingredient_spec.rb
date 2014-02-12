require 'spec_helper'

describe Ingredient do
  it { should have_many :menu_item_ingredients }
  it { should have_many(:menu_items).through(:menu_item_ingredients) }
end
