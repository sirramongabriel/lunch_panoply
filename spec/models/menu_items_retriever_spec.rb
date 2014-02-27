require 'spec_helper'

describe 'MenuItemsRetriever' do
  before do
    Faraday.stub(:get).and_return(fake_faraday_response)
  end 

  subject(:retriever) { MenuItemsRetriever.new(filters) }
  let(:filters) { { } }
  let(:fake_faraday_response) { "{  }" }

  describe '#retrieve' do
    it 'returns a collection of objects' do
      expect(subject.retrieve).to be_a_kind_of(Array)
    end
  end

  describe '#all' do
    let(:fake_faraday_response) { %q{ [{:id=>"512e961350d3ec6506e37d6e", :restaurant_id=>"50a123f8d8c6229f09000001", :course=>"Starter", :description=>"A smooth butternut squash soup, topped with green onions and herbs.", :calories=>261, :carbohydrates=>31, :protein=>5, :fat=>13, :vegetarian=>true, :paleo=>false, :vegan=>true, :gluten_free=>true, :bal=>false, :low_cal=>false, :low_carb=>false, :low_fat=>false, :hi_pro=>true, :price_cents=>455, :name=>"Curried Roasted Butternut Squash Soup (Regular, 12oz)", :full_image_path=>"http://res.cloudinary.com/hasty/image/upload/c_lfill,h_340,w_340/15.jpg"}] } }

    it 'makes a request using Faraday' do
      expect(Faraday).to receive(:get).once
      subject.all
    end

    it 'returns all menu items' do
      expect(subject.all).to have(1).record
      expect(subject.all.first).to be_a_kind_of(MenuItem)
    end
  end 
end
