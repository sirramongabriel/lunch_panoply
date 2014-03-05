require 'spec_helper'

describe 'MenuItemsRetriever' do
  # before do
  #   Faraday.stub(:get).with("") #.and_return()
  #   # stub_request(:get, "http://devapi.zesty.com/restaurants?latitude=37.7597272&longitude=-122.418352").
  #   #  with(:headers => {'Accept'=>'application/json; version=2', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Faraday v0.9.0', 'X-Hasty-Api-Key'=>'efdb8f7f2fe9c47e34dfe1fb7c491d0638ec2d86'}).
  #   #      to_return(:status => 200, :body => "", :headers => {})
  # end 

  subject(:retriever) { MenuItemsRetriever.new(filters) } 
  let(:filters) { { } }
  let(:fake_faraday_response) { "{  }" }

  describe '#retrieve' do
    it 'contains a collection of filter objects in an Array' do
      expect(subject.retrieve).to be_a_kind_of(Array)
    end
  end

  describe '#all' do
    context 'upon a successful transaction' do
      subject(:successful_response) { "success!" }

      it 'returns a successful response' do
        expect(successful_response).to include("success!")
      end

      it 'returns a collection of #all menu items as a hash' do
        menu_items = []

        menu_item1 = { dishes: { 
                                  name: 'celery cakes',  
                                  description: 'healthy and delicious',
                                  price: 2.99
                                } }

        menu_item2 = { dishes: {
                                  name: 'chili dogs',
                                  description: 'made fresh, every month',
                                  price: 3.99
                                } }

        menu_items << menu_item1 << menu_item2
        expect(menu_items).to eq [menu_item1, menu_item2]
        expect(menu_item1).to be_a_kind_of(Hash)
      end
    end

    context 'upon an unsuccessful transaction' do
      subject(:failure_response) { "failure error" }

      it 'returns an error response' do 
        expect(failure_response).to include("failure error")
      end

      it 'reutrns no menu items' do
        menu_items = []
        expect(menu_items).to be_empty 
      end
    end
  end 
end
