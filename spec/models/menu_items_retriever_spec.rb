require 'spec_helper'

describe 'MenuItemsRetriever' do
  before do
    Faraday.stub(:get) #.and_return()
    # stub_request(:get, "http://devapi.zesty.com/restaurants?latitude=37.7597272&longitude=-122.418352").
    #  with(:headers => {'Accept'=>'application/json; version=2', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Faraday v0.9.0', 'X-Hasty-Api-Key'=>'efdb8f7f2fe9c47e34dfe1fb7c491d0638ec2d86'}).
    #      to_return(:status => 200, :body => "", :headers => {})
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
    # let(:fake_faraday_response) { 
    #                               %q{ [{ :id=>"512e961350d3ec6506e37d6e", 
    #                               :restaurant_id=>"50a123f8d8c6229f09000001", 
    #                               :course=>"Starter", 
    #                               :description=>"A smooth butternut squash soup, topped with green onions and herbs.", 
    #                               :calories=>261, 
    #                               :carbohydrates=>31, 
    #                               :protein=>5, 
    #                               :fat=>13, 
    #                               :vegetarian=>true, 
    #                               :paleo=>false, 
    #                               :vegan=>true, 
    #                               :gluten_free=>true, 
    #                               :bal=>false, 
    #                               :low_cal=>false, 
    #                               :low_carb=>false, 
    #                               :low_fat=>false, 
    #                               :hi_pro=>true, 
    #                               :price_cents=>455, 
    #                               :name=>"Curried Roasted Butternut Squash Soup (Regular, 12oz)", 
    #                               :full_image_path=>"http://res.cloudinary.com/hasty/image/upload/c_lfill,h_340,w_340/15.jpg" }] } 
    #                             }

    it 'makes a request using Faraday' do
      # subject.all
      # expect(Faraday).to receive(:get).once
      # subject.all
      expect(Faraday).to receive(:get) { fake_faraday_response }
      # expect(Faraday).to receive(:get).once
      subject.all
    end

    it 'returns all menu items' do
      # expect(subject.all).to have(1).record
      expect(subject.all).to be_a_kind_of(MenuItem)
    end
  end 
end
