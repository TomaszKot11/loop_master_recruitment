# frozen_string_literal: true

describe SearchingService do
    let!(:products_first) { create_list :product, 5 }
    let(:products_the_same_name) { create_list :product, 3, title: 'The_same_same' }
    let(:products) { products_first + products_the_same_name }
    let(:service_call) { described_class.new(service_params: {query: query }).call }

    context 'searching products by name' do 
        let(:query) { "product:#{products_the_same_name.first.title}" }

        it 'should reuturn products with given name' do
            expect(service_call).to match_array(products_the_same_name)
        end
    end

    context 'searching products by genre'

    context 'searching products by label'

    context 'searching by badly formatted query' do 
        let(:bad_query) { 'bad_query' }

        it 'should return empty collection' 

        it 'shoudl set flash  variable with appropriate message' 
    end
end
