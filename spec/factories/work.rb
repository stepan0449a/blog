# frozen_string_literal: true

FactoryBot.define do
  factory :work, class: 'Work' do
    title { Faker::Lorem.word }
  end
end
