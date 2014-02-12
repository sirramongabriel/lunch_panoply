require 'spec_helper'

describe MenuItemIngredient do
  it { should belong_to :menu_item }
  it { should belong_to :ingredient }

end
