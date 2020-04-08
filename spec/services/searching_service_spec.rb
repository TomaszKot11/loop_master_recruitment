# frozen_string_literal: true

describe SearchingService do
    let(:product) { create :product }

    it 'should create product' do 
        5.times { p '----' }
        p product
        5.times { p '----' }
    end
end
