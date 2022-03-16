

RSpec.describe 'Dog', type: :system do
  let(:title) { 'string' }
  let!(:dog) { Dog.create(title: title) }
  it 'cft0' do
    expect(dog).to have_attributes(title: title)
  end

  describe 'index' do
    before{ visit dogs_path }

    it 'should ' do
      expect(page).to have_content ('Dogs')
      expect(page).to have_link ('New dog')
    end
  end
  describe 'new' do
    before{ visit new_dog_path }
    it 'should' do
      expect(page).to have_content ('New dog')
      expect(page).to have_link ('Back to dogs')
      expect(page).to have_field 'Title'
      expect(page).to have_button 'Create Dog'
    end
  end
  describe 'create' do
    before{ visit new_dog_path }
    it 'rbet' do
      fill_in 'Title', with: 'Some title for dog'
      click_button 'Create Dog'
      expect(page).to have_content 'Dog was successfully created'
      expect(page).to have_link 'Edit this dog'
      expect(page).to have_link 'Back to dogs'
      expect(page).to have_button 'Destroy this dog'
    end
  end
  describe 'destroy' do
    let!(:dog) { FactoryBot.create(:dog) }
    before { visit dog_path dog }
    it 'fdd' do
      click_button 'Destroy'
      expect(page).to have_content 'Dog was successfully destroyed.'
      expect(page).to have_content 'Dogs'
      expect(page).to have_link 'New dog'
    end

  end
  describe 'update' do
    let!(:dog) { FactoryBot.create(:dog) }
    before { visit dog_path dog }
    it 'tgv' do
      click_link 'Edit this dog'
      expect(page).to have_content 'Editing dog'
      expect(page).to have_field 'Title', with: dog.title
      expect(page).to have_button 'Update Dog'
      expect(page).to have_link 'Show this dog'
      expect(page).to have_link 'Back to dogs'
    end

  end
end