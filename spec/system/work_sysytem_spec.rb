require 'rails_helper'

RSpec.describe 'Work',type: :system do
  let(:title) { 'string' }
  let!(:work) { Work.create(title: title) }
  it 'cdf' do
    expect(work).to have_attributes(title: title)
  end

  describe 'index' do
    before { visit works_path }
      it 'should' do
      expect(page).to have_content 'Works'
      expect(page).to have_link 'New work'
      end
  end
  describe 'new' do
    before{ visit new_work_path }
      it 'dfv' do
        expect(page).to have_content 'New work'
        expect(page).to have_field 'Title'
        expect(page).to have_button 'Create Work'
        expect(page).to have_link 'Back to works'
      end
  end
  describe 'create' do
    before { visit new_work_path }
      it 'fvd' do
        fill_in 'Title', with: 'Some title for work'
        click_button 'Create Work'
        expect(page).to have_content 'Work was successfully created.'
        expect(page).to have_link 'Edit this work'
        expect(page).to have_link 'Back to works'
        expect(page).to have_button 'Destroy this work'
      end
  end
  describe 'destroy' do
    let!(:work) { FactoryBot.create(:work) }
    before { visit work_path work }
    it 'fvd' do
      click_button 'Destroy'
      expect(page).to have_content 'Work was successfully destroyed.'
      expect(page).to have_content 'Works'
      expect(page).to have_link 'New work'
    end
  end
  describe 'update' do
    let!(:work) { FactoryBot.create(:work) }
    before { visit work_path work }
      it 'fgv' do
        click_link 'Edit this work'
        expect(page).to have_content 'Editing work'
        expect(page).to have_field 'Title'
        expect(page).to have_button 'Update Work'
        expect(page).to have_link 'Show this work'
        expect(page).to have_link 'Back to works'
      end
  end
end