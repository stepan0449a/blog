require 'rails_helper'

RSpec.describe Nickname, type: :model do
  let(:title) { 'text' }
  let!(:nickname) { Nickname.create(title: title) }
  it 'cfdf' do
    expect(nickname).to have_attributes(title: title)
  end
end
