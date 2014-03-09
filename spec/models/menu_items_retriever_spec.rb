require 'spec_helper'

describe 'MenuItemsRetriever' do
  let(:menu_item1) { { dishes: { 
                                  name: 'celery cakes',  
                                  description: 'healthy and delicious',
                                  price: 2.99
                               } } }

  let(:menu_item2) { {  dishes: {
                                  name: 'chili dogs',
                                  description: 'made fresh, every month',
                                  price: 3.99
                                } } }



  subject(:retriever) { MenuItemsRetriever.new(filters) } 
  let(:filters) { { } }
  let(:fake_faraday_response) { "{ successful: :response }" }

  describe '#retrieve' do
    it 'contains a collection of filter objects in an Array' do
      expect(subject.retrieve).to be_a_kind_of(Array)
    end
  end

  describe '#all' do
    context 'upon a successful transaction' do
      it 'returns a successful response' do
        expect(fake_faraday_response).to include("{ successful: :response }")
        expect(fake_faraday_response).to be_a_kind_of(String)
      end

      it 'returns a collection of #all menu items as a hash' do
        menu_items = retriever.retrieve
        menu_items << menu_item1 << menu_item2
        expect(menu_items).to eq [menu_item1, menu_item2]
        expect(menu_item1).to be_a_kind_of(Hash)
      end
    end

    context 'upon an unsuccessful transaction' do
      subject(:failure_response) { "{ failure: :error }" }

      it 'returns an error response' do 
        expect(failure_response).to include("{ failure: :error }")
      end

      it 'returns no menu items' do
        menu_items = retriever.retrieve
        expect(menu_items).to be_empty 
        expect(menu_items).to be_a_kind_of(Array)
      end
    end
  end 

  describe '#gluten_free' do
    context 'upon successful transacton' do
      it 'returns a collection of objects considered #gluten_free' do
        menu_items = []
        filters =    { dishes: { gluten_free: true }}
        menu_item1 = { dishes: { gluten_free: true }}
        menu_item2 = { dishes: { gluten_free: true }}  
        menu_items << menu_item1 << menu_item2     
        expect(menu_items).to eq [menu_item1, menu_item2]
        expect(menu_item1).to be_a_kind_of(Hash)
        expect(menu_item2).to be_a_kind_of(Hash)
      end

      it 'does not include objects where #gluten_free value is false' do
        filters =    { dishes: { gluten_free: true }}
        menu_item1 = { dishes: { gluten_free: false }}
        menu_item2 = { dishes: { gluten_free: true }}
        expect(filters).not_to eq menu_item1
        expect(filters).to eq menu_item2
      end
    end

    context 'upon unsuccessful transaction' do
      subject(:failure_response) { "{ failure: :error }" }

      it 'returns an error response' do 
        expect(failure_response).to include("{ failure: :error }")
      end

      it 'returns empty array when there are no #gluten_free menu items' do
        menu_items = retriever.retrieve
        expect(menu_items).to be_empty
        expect(menu_items).to be_a_kind_of(Array)
      end
    end
  end

  describe '#hi_protein' do
    context 'upon successful transacton' do
      it 'returns a collection of objects considered #hi_protein' do
        menu_items = retriever.retrieve
        menu_item1 = { dishes: { hi_protein: true }}
        menu_item2 = { dishes: { hi_protein: true }}
        menu_items << menu_item1 << menu_item2
        expect(menu_items).to eq [menu_item1, menu_item2]
      end

      it 'does not include objects where #hi_protein value is false' do 
        filters =    { dishes: { hi_protein: true }}
        menu_item1 = { dishes: { hi_protein: false }}
        menu_item2 = { dishes: { hi_protein: true }}
        expect(filters).not_to eq menu_item1
        expect(filters).to eq menu_item2
      end
    end

    context 'upon unsuccessful transaction' do
      subject(:failure_response) { "{ failure: :error }" }

      it 'returns an error response' do 
        expect(failure_response).to include("{ failure: :error }")
      end

      it 'returns empty array when there are no #hi_protein menu items' do
        menu_items = retriever.retrieve
        expect(menu_items).to be_empty
        expect(menu_items).to be_a_kind_of(Array)
      end
    end
  end

  describe '#paleo' do
    context 'upon successful transacton' do
      it 'returns a collection of objects considered #paleo complient' do
        menu_items = retriever.retrieve
        menu_item1 = { dishes: { paleo: true }}
        menu_item2 = { dishes: { paleo: true }}
        menu_items << menu_item1 << menu_item2
        expect(menu_items).to eq [menu_item1, menu_item2]
      end

      it 'does not include objects where #paleo value is false' do
        filters =    { dishes: { paleo: true }}
        menu_item1 = { dishes: { paleo: false }}
        menu_item2 = { dishes: { paleo: true }}
        expect(filters).not_to eq menu_item1
        expect(filters).to eq menu_item2
      end
    end

    context 'upon unsuccessful transaction' do
      subject(:failure_response) { "{ failure: :error }" }

      it 'returns an error response' do 
        expect(failure_response).to include("{ failure: :error }")
      end

      it 'returns empty array when there are no #paleo complient menu items' do
        menu_items = retriever.retrieve
        expect(menu_items).to be_empty
        expect(menu_items).to be_a_kind_of(Array)
      end
    end
  end

  describe '#vegan' do
    context 'upon successful transacton' do
      it 'returns a collection of objects considered #vegan complient' do
        menu_items = retriever.retrieve
        menu_item1 = { dishes: { paleo: true }}
        menu_item2 = { dishes: { paleo: true }}
        menu_items << menu_item1 << menu_item2
        expect(menu_items).to eq [menu_item1, menu_item2]
      end

      it 'does not include objects where #vegan value is false' do
        filters =    { dishes: { paleo: true }}
        menu_item1 = { dishes: { paleo: false }}
        menu_item2 = { dishes: { paleo: true }}
        expect(filters).not_to eq menu_item1
        expect(filters).to eq menu_item2
      end
    end

    context 'upon unsuccessful transaction' do
      subject(:failure_response) { "{ failure: :error }" }

      it 'returns an error response' do 
        expect(failure_response).to include("{ failure: :error }")
      end

      it 'returns empty array when there are no #vegan menu items' do
        menu_items = retriever.retrieve
        expect(menu_items).to be_empty
        expect(menu_items).to be_a_kind_of(Array)
      end
    end
  end

  describe '#vegetarian' do
    context 'upon successful transacton' do
      it 'returns a collection of objects considered #vegetarian complient' do
        menu_items = retriever.retrieve
        menu_item1 = { dishes: { vegetarian: true }}
        menu_item2 = { dishes: { vegetarian: true }}
        menu_items << menu_item1 << menu_item2
        expect(menu_items).to eq [menu_item1, menu_item2]
      end

      it 'does not include objects where #vegetarian value is false' do
        filters = { dishes: { vegetarian: true }}
        menu_item1 = { dishes: { vegetarian: false }}
        menu_item2 = { dishes: { vegetarian: true }}
        expect(filters).not_to eq menu_item1
        expect(filters).to eq menu_item2
      end
    end

    context 'upon unsuccessful transaction' do
      subject(:failure_response) { "{ failure: :error }" }

      it 'returns an error response' do 
        expect(failure_response).to include("{ failure: :error }")
      end

      it 'returns empty array when there are no #vegetarian menu items' do 
        menu_items = retriever.retrieve
        expect(menu_items).to be_empty
        expect(menu_items).to be_a_kind_of(Array)
      end
    end
  end
end
