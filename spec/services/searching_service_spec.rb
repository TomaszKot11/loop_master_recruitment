# frozen_string_literal: true

describe SearchingService do
  let!(:products_first) { create_list :product, 5 }
  let(:products_the_same_name) { create_list :product, 3, title: 'The_same_same' }
  let(:products) { products_first + products_the_same_name }
  let(:mock_flash) { {} }
  let(:service_call) { described_class.new(service_params: { query: query, flash: mock_flash }).call }

  context 'searching products by name' do
    let(:query) { "product:#{products_the_same_name.first.title}" }

    it 'reuturns products with given name' do
      expect(service_call).to match_array(products_the_same_name)
    end
  end

  context 'searching products by genre'

  context 'searching products by label'

  context 'searching by badly formatted query' do
    let(:query) { 'bad_query' }

    context 'when flash param passed' do
      it 'returns empty collection' do
        expect(service_call).to match_array([])
      end

      it 'sets flash variable with appropriate message' do
        service_call
        expect(mock_flash[:alert]).to eq 'Wrong query format. The proper format is model_name:query_string.'
      end
    end
  end
end
