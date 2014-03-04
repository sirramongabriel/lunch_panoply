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
    it 'returns a collection of objects' do
      expect(subject.retrieve).to be_a_kind_of(Array)
    end
  end

  describe '#all' do
    context 'upon success' do
      it 'makes a request using Faraday' do

        request = stub_request(:get, "http://localhost").
          to_return(body: "abc")

        expect(request).to have_status(:ok)
        # expect(stub_request(:get, "http://localhost")).to be_a_kind_of(WebMock)

      end

      it 'returns all menu items' do
        stub_request(:get, "http://devapi.zesty.com/restaurants?latitude=37.7597272&longitude=-122.418352").
          to_return(lambda { |request| { :body => request.body } })
      end
    end

    context 'upon failure' do
      it 'should'
    end
  end 
end
