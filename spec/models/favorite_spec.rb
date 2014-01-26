require 'spec_helper'

describe Favorite do
  it { should belong_to(:employee) }
  it { should belong_to(:menu_item) }
end
