# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Posts', type: :system do
  describe 'index' do
    before { visit posts_path }

    it 'should load all posts' do
      subject
      expect(page).to have_http_status :ok
      expect(page).to have_link 'New post', href: new_post_path
    end
  end
end
