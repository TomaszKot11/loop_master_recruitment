# frozen_string_literal: true

describe Product do
  describe '#relations' do
    it { is_expected.to have_many(:genres_products) }
    it { is_expected.to have_many(:genres).through(:genres_products) }
    it { is_expected.to belong_to(:label).optional(true) }
  end
end
