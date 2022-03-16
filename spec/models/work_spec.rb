require 'rails_helper'

RSpec.describe Work, type: :model do
  describe '#create' do
    subject { Work.create!(create_params) }
    let(:create_params) { {} }


    context 'when title is exist' do
      let(:title) { "dsfsdf" }
      let(:create_params) { { title: title } }

      it 'should ' do
        expect(subject.errors.messages).to be_empty
      end
    end

    context 'when title is empty' do
      let(:create_params) { { title: nil } }

      it 'should' do
        expect { subject }.to raise_error "Validation failed: Title can't be blank"
      end
    end
  end

  describe '' do
    assdasd
  end
end
