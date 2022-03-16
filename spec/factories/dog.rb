# frozen_string_literal: true

FactoryBot.define do
  factory :dog, class: 'Dog' do
    title { Faker::Lorem.word }
  end
end
