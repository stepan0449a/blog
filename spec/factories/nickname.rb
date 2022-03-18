# frozen_string_literal: true

FactoryBot.define do
  factory :nickname, class: 'Nickname' do
    title { Faker::Lorem.word }
  end
end
