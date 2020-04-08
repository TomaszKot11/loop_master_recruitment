# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    title { FFaker::Music.song }
    price { '2.2' }
    release_date { DateTime.new(1990, 5, 5) }
  end
end
